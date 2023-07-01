import 'package:flutter/material.dart';
import 'pagina3.dart';

void main() {
  runApp(Pagina2());
}

class Pagina2 extends StatelessWidget {
  final int lados;
  final String poligono;
  final tipos = {3:4, 4:10, 5:2, 6:2, 7:2, 8:2};
  
  Pagina2({super.key, this.lados = 0, this.poligono = ''});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('$lados'' lados'),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 5,
            ),
            Align(
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 2,
                runSpacing: 2,
                children: [
                  for(var i = tipos[lados];i!>0;i--) Icon(poligono: poligono, tipo: i, lados: lados),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Icon extends StatelessWidget {
  final String poligono;
  final int tipo, lados;

  const Icon({super.key, this.poligono = '', this.tipo = 0, this.lados = 0});

  @override
  Widget build(BuildContext context) {
    return Ink.image(
      fit: BoxFit.fill,
      height: 150,
      width: 150,
      image: AssetImage('assets/$poligono''_tipo_$tipo''.png'),
      child: InkWell(
        onTap:() {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Pagina3(poligono: poligono, tipo: tipo, lados: lados),),);
        },
      ),
    );
  }
}