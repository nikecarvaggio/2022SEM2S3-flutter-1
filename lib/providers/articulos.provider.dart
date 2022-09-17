import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/articulo.model.dart';

class ArticuloProvider {
  Future<List<ArticuloModel>> obtenerArticulos() async {
    List<ArticuloModel> articulos = [];
    var client = http.Client();

    try {
      Map<String, String> parametros = {
        'q': 'tesla',
        'from': '2022-08-17',
        'sortBy': 'publishedAt',
        'apiKey': 'd6c6889eec0b4f4cb93c499b5d8d0293',
      };

      var url = Uri.https('newsapi.org', 'v2/everything', parametros);
      var response = await http.get(url);
      print(response.body);

      var decodeResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

      decodeResponse["articles"]
          .forEach((e) => articulos.add(ArticuloModel.fromJson(e)));

      return articulos;
    } finally {
      client.close();
    }
  }
}
