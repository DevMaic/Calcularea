import 'dart:math';
import 'package:calcularea/pagina2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(Pagina3());
}
//quadrado 8 e 10
class Pagina3 extends StatefulWidget {
  final String poligono;
  final int tipo, lados;
  final Map quantMedidas = {
    'triangulo':{1:[1, 0], 2:[1,1], 3:[2,1], 4:[3,0]},
    'quadrado':{1:[1,0], 2:[2,0], 3:[2,1], 4:[2,1], 5:[2,0], 6:[1,1], 7:[4,1], 8:[4,2], 9:[4,1], 10:[4,2]},
    'pentagono':{1:[1,0], 2:[5,2]},
    'hexagono':{1:[1,0], 2:[6,3]},
    'heptagono':{1:[1,0], 2:[7,4]},
    'octogono':{1:[1,0], 2:[8,5]}
  };
  static String resultado = 'Resultado';
  static List operandos = [];

  Pagina3({super.key, this.poligono = '', this.tipo = 0, this.lados = 0});

  @override
  State <Pagina3> createState() => _Pagina3State();
}

class _Pagina3State extends State<Pagina3> {
  String calcular(List operandos, String poligono, int tipo) {
    
    switch(poligono) {
      case 'triangulo':
        switch(tipo) {
          case 1:
            return ((pow(operandos[0], 2)*sqrt(3))/4).toStringAsFixed(2);
          case 2:
            return ((operandos[0]*operandos[1])/2).toStringAsFixed(2);
          case 3:
            return ((operandos[0]*operandos[1]*sin(operandos[2]))/2).toStringAsFixed(2);
          case 4:
            double p = ((operandos[0]+operandos[1]+operandos[2])/2);
            return (sqrt(p*(p-operandos[0])*(p-operandos[1])*(p-operandos[2]))).toStringAsFixed(2);
        }
        break;
      case 'quadrado':
        switch(tipo) {
          case 1:
            return (pow(operandos[0], 2)).toStringAsFixed(2);
          case 2:
            return (operandos[0]*operandos[1]).toStringAsFixed(2);
          case 3:
            return (((operandos[0]+operandos[1])*operandos[2])/2).toStringAsFixed();
          case 4:
            return (((operandos[0]+operandos[1])*operandos[2])/2).toStringAsFixed();
          case 5:
            return (operandos[0]*operandos[1]).toStringAsFixed(2);
          case 6:
            return (operandos[0]*operandos[1]).toStringAsFixed(2);
          case 7:
            List aux1 = [operandos[1],operandos[2],operandos[4]];
            List aux2 = [operandos[0],operandos[3],operandos[4]];
            return (double.parse(calcular(aux1, 'triangulo', 4)) + 
                    double.parse(calcular(aux2, 'triangulo', 4))).toStringAsFixed(2);
          case 8:
            return (((1/2)*operandos[0]*operandos[1]*(sqrt(1-pow(((2-pow(operandos[4], 2))/2), 2))))+
                    (1/2)*operandos[2]*operandos[3]*(sqrt(1-pow(((2-pow(operandos[5], 2))/2), 2)))).toStringAsFixed(2);
          case 9:
            List aux1 = [operandos[0],operandos[1],operandos[4]];
            List aux2 = [operandos[2],operandos[3],operandos[4]];
            return (double.parse(calcular(aux1, 'triangulo', 1)) + 
                    double.parse(calcular(aux2, 'triangulo', 1))).toStringAsFixed(2);
          case 10:
            return (((1/2)*operandos[1]*operandos[2]*(sqrt(1-pow(((2-pow(operandos[4], 2))/2), 2)))) +
                     (1/2)*operandos[3]*operandos[0]*(sqrt(1-pow(((2-pow(operandos[5], 2))/2), 2)))).toStringAsFixed(2);
        }
        break;
      case 'pentagono':
        switch(tipo) {
          case 1:
            return ((pow(operandos[0], 2)/4)*sqrt(25 + 10*sqrt(5))).toStringAsFixed(2);
          case 2:
            List aux1 = [operandos[2], operandos[3], operandos[6]];
            List aux2 = [operandos[1], operandos[5], operandos[6]];
            List aux3 = [operandos[0], operandos[2], operandos[5]];
            return (calcular(aux1, 'triangulo', 4) + 
                    calcular(aux2, 'triangulo', 4) + 
                    calcular(aux3, 'triangulo', 4));
        }
        break;
      case 'hexagono':
        switch(tipo) {
          case 1:
            return ((3*pow(operandos[0], 2)*sqrt(3))/2).toStringAsFixed(2);
          case 2:
            List aux1 = [operandos[0], operandos[1], operandos[6]];
            List aux2 = [operandos[6], operandos[7], operandos[5]];
            List aux3 = [operandos[2], operandos[7], operandos[8]];
            List aux4 = [operandos[3], operandos[4], operandos[8]];
           return (double.parse(calcular(aux1, 'triangulo', 4)) + 
                   double.parse(calcular(aux2, 'triangulo', 4)) + 
                   double.parse(calcular(aux3, 'triangulo', 4)) + 
                   double.parse(calcular(aux4, 'triangulo', 4))).toStringAsFixed(2);
        }
        break;
      case 'heptagono':
        switch(tipo) {
          case 1:
            return (pow(operandos[0], 2)*3.15339105).toStringAsFixed(2);
          case 2:
            List aux1 = [operandos[0], operandos[6], operandos[7]];
            List aux2 = [operandos[7], operandos[8], operandos[1]];
            List aux3 = [operandos[9], operandos[8], operandos[5]];
            List aux4 = [operandos[9], operandos[10], operandos[2]];
            List aux5 = [operandos[3], operandos[4], operandos[10]];
           return (double.parse(calcular(aux1, 'triangulo', 4)) + 
                   double.parse(calcular(aux2, 'triangulo', 4)) +
                   double.parse(calcular(aux3, 'triangulo', 4)) +
                   double.parse(calcular(aux4, 'triangulo', 4)) +
                   double.parse(calcular(aux5, 'triangulo', 4))).toStringAsFixed(2);
        }
        break;
      case 'octogono':
        switch(tipo) {
          case 1:
            return (pow(operandos[0], 2)*4.82842712).toStringAsFixed(2);
          case 2:
            List aux1 = [operandos[4], operandos[5], operandos[12]];
            List aux2 = [operandos[12], operandos[11], operandos[3]];
            List aux3 = [operandos[11], operandos[10], operandos[6]];
            List aux4 = [operandos[10], operandos[9], operandos[2]];
            List aux5 = [operandos[9], operandos[8], operandos[7]];
            List aux6 = [operandos[0], operandos[1], operandos[8]];
           return (double.parse(calcular(aux1, 'triangulo', 4)) + 
                   double.parse(calcular(aux2, 'triangulo', 4)) +
                   double.parse(calcular(aux3, 'triangulo', 4)) +
                   double.parse(calcular(aux4, 'triangulo', 4)) +
                   double.parse(calcular(aux5, 'triangulo', 4)) +
                   double.parse(calcular(aux6, 'triangulo', 4))).toStringAsFixed(2);
        }
    }
    
    return 'Resultado';
  }

  String converteChar(int i) {
    if(widget.quantMedidas[widget.poligono][widget.tipo][1]!=1) {
      return String.fromCharCode(118 + i);
    } else if (widget.poligono == 'triangulo' && widget.tipo == 3) {
      return String.fromCharCode(233 + i);
    } else if(widget.poligono == 'quadrado'){
      return String.fromCharCode(120 + i);
    } else if(widget.quantMedidas[widget.poligono][widget.tipo][1]>3){
      return String.fromCharCode(118);
    }else{
      return String.fromCharCode(104);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () {
            Pagina3.resultado = 'Resultado';
            Pagina3.operandos.clear();
            Navigator.of(context).pop(MaterialPageRoute(builder: (context) => Pagina2(),),);
          },),
        title: Text('${widget.lados} lados'),
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
          SizedBox(height: 30),
          Align(
            child: Ink(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff66cc00), width: 1),
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage('assets/${widget.poligono}''_tipo_${widget.tipo}''.png'),
                  fit: BoxFit.fill,
                ),
              ),
              height: 250,
              width: 250,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for(int i=0;i<widget.quantMedidas[widget.poligono][widget.tipo][0];i++) TextField(
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.]')),],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: String.fromCharCode(97+i),
                  ),
                  onChanged: (text) {
                    if(Pagina3.operandos.isEmpty) {
                      for(int aux = 0; aux<(widget.quantMedidas[widget.poligono][widget.tipo][0]+widget.quantMedidas[widget.poligono][widget.tipo][1]);aux++) {
                        Pagina3.operandos.add(1.0);
                      }
                    }
                    if(text.isNotEmpty) {
                      Pagina3.operandos[i] = double.parse(text);
                    }
                    debugPrint('${Pagina3.operandos}');
                  },
                ),
                for(int i=0;i<widget.quantMedidas[widget.poligono][widget.tipo][1];i++) TextField(
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.]')),],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: converteChar(i),                  
                  ),
                  onChanged: (text) {
                    if(Pagina3.operandos.isEmpty) {
                      for(int aux = 0; aux<(widget.quantMedidas[widget.poligono][widget.tipo][0]+widget.quantMedidas[widget.poligono][widget.tipo][1]);aux++) {
                        Pagina3.operandos.add(1.0);
                      }
                    }
                    if(text.isNotEmpty) {
                      Pagina3.operandos[i] = double.parse(text);
                    }
                    debugPrint('${Pagina3.operandos}');
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Pagina3.resultado = calcular(Pagina3.operandos, widget.poligono, widget.tipo);
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