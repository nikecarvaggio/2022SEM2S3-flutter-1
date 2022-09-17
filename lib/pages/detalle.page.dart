import 'package:flutter/material.dart';
import 'package:newnoticias/models/articulo.model.dart';

class DetallePage extends StatelessWidget {
  DetallePage({super.key, required this.articulo});

  ArticuloModel articulo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detalle articulo")),
      body: Container(
        child: Text(articulo.title),
      ),
    );
  }
}
