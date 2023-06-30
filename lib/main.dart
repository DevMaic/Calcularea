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
                children: [
                  Icon(path: 'assets/3lados.png', lados: 3),
                  Icon(path: 'assets/4lados.png', lados: 4),
                  Icon(path: 'assets/5lados.png', lados: 5),
                  Icon(path: 'assets/6lados.png', lados: 6),
                  Icon(path: 'assets/7lados.png', lados: 7),
                  Icon(path: 'assets/8lados.png', lados: 8),
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
  final String path;
  final int lados;

  const Icon({super.key, this.path = '', this.lados = 0});

  @override
  Widget build(BuildContext context) {
    return Ink.image(
      fit: BoxFit.fill,
      height: 150,
      width: 150,
      image: AssetImage(path),
      child: InkWell(
        onTap:() {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Pagina2(numeroDeLados: "$lados Lados"),),);
        },
      ),
    );
  }
}