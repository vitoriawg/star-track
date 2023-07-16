class Anime{
  int? codigo;
  String? nome;
  String? descricao;
  Anime({this.descricao, this.nome, this.codigo});

  Map<String, dynamic> toMap(){
    return {
      'codigo': codigo,
      'nome': nome,
      'descricao': descricao
    };
  }
  Anime.fromMap(Map<String, dynamic> map):
        descricao = map['descricao'],
        nome = map['nome'],
        codigo = map['codigo'];

}