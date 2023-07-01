import 'pagina2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Calculárea"),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Align(
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 2,
                runSpacing: 2,
                children: const [
                  Icon(lados: 3, poligono: 'triangulo'),
                  Icon(lados: 4, poligono: 'quadrado'),
                  Icon(lados: 5, poligono: 'pentagono'),
                  Icon(lados: 6, poligono: 'hexagono'),
                  Icon(lados: 7, poligono: 'heptagono'),
                  Icon(lados: 8, poligono: 'octogono'),
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
  final int lados;
  final String poligono;

  const Icon({super.key, this.lados = 0, this.poligono = ''});

  @override
  Widget build(BuildContext context) {
    return Ink.image(
      fit: BoxFit.fill,
      height: 150,
      width: 150,
      image: AssetImage('assets/$lados''lados.png'),
      child: InkWell(
        onTap:() {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Pagina2(lados: lados, poligono: poligono),),);
        },
      ),
    );
  }
}