import '../utils/http.dart';
import '../model/musica.dart';
import '../repositories/musica_repository.dart';

class MusicaController {
  final MusicaRepository _repository;

  MusicaController(this._repository);
  HttpResponse getAll(HttpRequest req) {
    var res = _repository.getAll();
    return HttpResponse(res.map((e) => e.toJson()).toList(), statusCode: 200);
  }

  HttpResponse avaliar(HttpRequest req) {
    if (req.body == null) {
      return HttpResponse('body not content', statusCode: 400);
    }
    var res = _repository.avaliar(req.body!['nome'], req.body!['avaliacao']);

    return HttpResponse(null, statusCode: 200);
  }

  HttpResponse postMusica(HttpRequest req) {
    try {
      if (req.body == null) {
        return HttpResponse('body not content', statusCode: 400);
      }
      if (req.body!['nome'] != null && req.body!['nome'] != '') {
        var musica = Musica(req.body!['nome']);
        print(musica.toJson());
        var res = _repository.setMusica(musica);
        if (res) {
          return HttpResponse(musica, statusCode: 200);
        }
        return HttpResponse('nome already exists', statusCode: 400);
      }
      return HttpResponse('nome is required', statusCode: 400);
    } catch (e) {
      return HttpResponse('nome is required', statusCode: 400);
    }
  }
}
