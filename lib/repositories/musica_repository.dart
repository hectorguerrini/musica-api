import '../model/musica.dart';

class MusicaRepository {
  final List<Musica> musicas = [];

  List<Musica> getAll() {
    var list = musicas;
    list.sort((a, b) {
      var cmp = a.avaliacao.compareTo(b.avaliacao);
      if (cmp == 0) {
        return a.nome.compareTo(b.nome);
      }
      return cmp;
    });
    return list;
  }

  bool avaliar(String nome, int avaliacao) {
    if (avaliacao > 0 && avaliacao < 6) {
      musicas.forEach((element) {
        if (element.nome.toLowerCase() == nome.toLowerCase()) {
          element.avaliacao = avaliacao;
        }
      });
      return true;
    }
    return false;
  }

  bool setMusica(Musica value) {
    if (!musicas.any(
        (element) => element.nome.toLowerCase() == value.nome.toLowerCase())) {
      musicas.add(value);
      return true;
    }
    return false;
  }
}
