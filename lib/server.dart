import 'package:music_api/repositories/musica_repository.dart';

import 'utils/http.dart';
import 'controllers/musica_controller.dart';
import 'package:aws_lambda_dart_runtime/aws_lambda_dart_runtime.dart';

void main() async {
  late MusicaController controller;
  var repository = MusicaRepository();
  Map<String, dynamic> handlerRouter(HttpRequest req) {
    switch (req.rawPath.toLowerCase()) {
      case '/all':
        return controller.getAll(req).toJson();
      case '/avaliar':
        return controller.avaliar(req).toJson();
      case '/musica':
        return controller.postMusica(req).toJson();
      case '/ping':
        return HttpResponse('pong', statusCode: 200).toJson();
      default:
        return HttpResponse(null, statusCode: 404).toJson();
    }
  }

  final Handler<HttpRequest> musicaHandler =
      (context, HttpRequest event) async {
    controller = MusicaController(repository);
    return await handlerRouter(event);
  };
  Runtime()
    ..registerEvent<HttpRequest>(
        (Map<String, dynamic> json) => HttpRequest.fromJson(json))
    ..registerHandler<HttpRequest>("musica.handler", musicaHandler)
    ..invoke();
}
