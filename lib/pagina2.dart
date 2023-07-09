import 'package:calcularea/main.dart';
import 'package:flutter/material.dart';
import 'colors.dart';
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData( 
        primarySwatch: themeif,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('$lados'' lados'),
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
          leading: BackButton(onPressed: () {
            Navigator.of(context).pop(MaterialPageRoute(builder: (context) => MyApp(),),);
          },),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            Align(
              child: Wrap(
                alignment: WrapAlignment.spaceEvenly,
                crossAxisAlignment: WrapCrossAlignment.end,
                spacing: 15,
                runSpacing: 12,
                children: [
                  for(int i = 1;i <= tipos[lados]!;i++) Icon(poligono: poligono, tipo: i, lados: lados),
                ],
              ),
            ),
            SizedBox(
              height: 20,
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
    return Ink(
       decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 10,
          offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage('assets/$poligono''_tipo_$tipo''.png'),
          fit: BoxFit.fill,
        ),
      ),
      height: ((MediaQuery.of(context).size.shortestSide/2)-25),
      width: ((MediaQuery.of(context).size.shortestSide/2)-25),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap:() {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Pagina3(poligono: poligono, tipo: tipo, lados: lados),),);
        },
      ),
    );
  }
}