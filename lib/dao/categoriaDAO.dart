import 'dart:convert';

import 'package:http/http.dart' as http;
import '../model/categoria.dart';
import 'OpenDatabase.dart';

class CategoriaDAO{
  adicionar(Categoria l) async{
    String token = await getToken();
    final header = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token'};
    await http.post(Uri.parse("http://10.0.2.2:8080/categoria"),headers: header, body: jsonEncode(l.toMap()));
  }

  Future<List<Categoria>> getCategorias() async {
    String token = await getToken();
    final header = {'Content-Type': 'application/json', 'Authorization': 'Bearer $token'};
    final response = await http.get(Uri.parse("http://10.0.2.2:8080/categoria"),headers: header);
    final jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
    return jsonResponse.map<Categoria>((json)=> Categoria.fromMap(json)).toList();
  }
}