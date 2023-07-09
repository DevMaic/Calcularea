import 'package:calcularea/colors.dart';
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: themeif,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Calculárea", style: TextStyle(fontSize: 28),),
          actions: const [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
              child: Image(
                image: AssetImage('assets/logo_IF.png'),
                width: 20,
                height: 20,
              ),
            )
          ],
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            Align(
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 15,
                runSpacing: 8,
                children: [
                  Icon(lados: 3, poligono: 'triangulo'),
                  Icon(lados: 4, poligono: 'quadrado'),
                  Icon(lados: 5, poligono: 'pentagono'),
                  Icon(lados: 6, poligono: 'hexagono'),
                  Icon(lados: 7, poligono: 'heptagono'),
                  Icon(lados: 8, poligono: 'octogono'),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class Icon extends StatelessWidget {
  final int lados;
  final String poligono;
  final Map nomesComAcento = {'triangulo':'Triângulo',
                              'quadrado':'Quadrilátero', 
                              'pentagono':'Pentágono',
                              'hexagono':'Hexágono',
                              'heptagono':'Heptágono',
                              'octogono':'Octógono'};

  Icon({super.key, this.lados = 0, this.poligono = ''});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
        child: Ink(
          decoration: BoxDecoration(
            //color: Color.fromARGB(255, 58, 115, 2),
            boxShadow: [
              BoxShadow(
                //color: Color.fromARGB(255, 54, 170, 60).withOpacity(0.5),
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 10,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage('assets/$lados''lados.png'),
              fit: BoxFit.fill,
            ),
          ),
          height: (((MediaQuery.of(context).size.shortestSide/2)-25)*1.27),
          width: ((MediaQuery.of(context).size.shortestSide/2)-25),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      Pagina2(lados: lados, poligono: poligono),
                ),
              );
            },
            child: Align(
              alignment: Alignment(0, 0.75),
              child: Text(nomesComAcento[poligono], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
          ),
        ),
      )
    );
  }
}