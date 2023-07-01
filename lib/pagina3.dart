import 'dart:math';
import 'package:calcularea/pagina2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(Pagina3());
}

class Pagina3 extends StatefulWidget {
  final String poligono;
  final int tipo, lados;
  static String resultado = 'Resultado';
  static List operandos = [];

  const Pagina3({super.key, this.poligono = '', this.tipo = 0, this.lados = 0});

  @override
  State <Pagina3> createState() => _Pagina3State();
}

class _Pagina3State extends State<Pagina3> {
  String calcular(List operandos) {
    double p = (operandos[0]+operandos[1]+operandos[2])/2;

    return (sqrt(p*(p-operandos[0])*(p-operandos[1])*(p-operandos[2]))).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () {
            Pagina3.resultado = 'Resultado';
            Navigator.of(context).pop(MaterialPageRoute(builder: (context) => Pagina2(),),);
          },),
        title: Text('${widget.lados} lados'),
      ),
      body: ListView(
        children: [
          SizedBox(height: 5),
          Align(
            child: Image(
              image: AssetImage('assets/${widget.poligono}''_tipo_${widget.tipo}.png'),),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for(int i=0;i<widget.lados;i++) TextField(
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Lado ''${String.fromCharCode(97+i)}',
                  ),
                  onChanged: (text) {
                    Pagina3.operandos.add(0);
                    Pagina3.operandos[i] = int.parse(text);
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Pagina3.resultado = calcular(Pagina3.operandos);
                    });
                  }, 
                  child: Text('Calcular'),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(Pagina3.resultado),
                      //child: Text(Pagina3.resultado),
                  ),
                )
              ]
            ),
          ),
        ],
      ),
    );
  }
}