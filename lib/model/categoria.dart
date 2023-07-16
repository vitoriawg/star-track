import 'package:mobileapp/model/anime.dart';

class Categoria{
  int? codigo;
  Anime anime;
  String? descricao;

  Categoria({required this.anime, this.descricao, this.codigo});

  Map<String, dynamic> toMap() {
    return{
      'codigo': codigo,
      'anime': anime.toMap(),
      'descricao': descricao
    };
  }

  factory Categoria.fromMap(Map<String, dynamic> json){
    return Categoria(
        anime: Anime.fromMap(json['anime']),
        codigo: json['codigo'],
        descricao: json['descricao']
    );
  }
}