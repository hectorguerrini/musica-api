class Musica {
  static int count = 0;
  late int id;
  String nome;
  int avaliacao = 0;
  Musica(this.nome) {
    this.id = count;
    count += 1;
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'nome': nome, 'avaliacao': avaliacao};
  }
}
