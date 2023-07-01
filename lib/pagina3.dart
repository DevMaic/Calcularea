import 'package:flutter/material.dart';

void main() {
    runApp(Pagina3());
}

class Pagina3 extends StatelessWidget {
  final String poligono;
  final int tipo, lados;

  const Pagina3({super.key, this.poligono = '', this.tipo = 0, this.lados = 0});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$lados lados'),
      ),
    );
  }
}