class Anime{
  int? codigo_anime;
  String? nome;
  String? descricao;
  Anime({this.descricao, this.nome, this.codigo_anime});

  Map<String, dynamic> toMap(){
    return {
      'codigo_anime': codigo_anime,
      'nome': nome,
      'descricao': descricao
    };
  }
  Anime.fromMap(Map<String, dynamic> map):
        descricao = map['descricao'],
        nome = map['nome'],
        codigo_anime = map['codigo_anime'];

}