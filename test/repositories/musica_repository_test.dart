import 'package:music_api/model/musica.dart';
import 'package:music_api/repositories/musica_repository.dart';
import 'package:test/test.dart';

void main() {
  late MusicaRepository repository;
  setUp(() {
    repository = MusicaRepository();
  });

  test('Teste de Ordenação', () {
    repository.setMusica(Musica('Panzerkampf'));
    repository.setMusica(Musica('Cliffs of Gallipoli'));
    repository.setMusica(Musica('Art of war'));

    var res = repository.getAll();

    expect(res[0].nome, 'Art of war');
    expect(res[1].nome, 'Cliffs of Gallipoli');
    expect(res[2].nome, 'Panzerkampf');
  });
  test('Teste de Cadastro', () {
    repository.setMusica(Musica('All to well'));
    var res = repository.getAll();

    expect(res[0].avaliacao, 0);
  });
}
