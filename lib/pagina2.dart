import 'package:flutter/material.dart';

void main() {
  runApp(const Pagina2());
}

// class Pagina2 extends StatefulWidget {
//   final String numeroDeLados;
//   const Pagina2({super.key, this.numeroDeLados = ''});

//   @override
//   State<Pagina2> createState() => _Pagina2State();
// }

// class _Pagina2State extends State<Pagina2> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.numeroDeLados),
//       ),
//     );
//   }
// }
class Pagina2 extends StatelessWidget {
  final String numeroDeLados;
  
  const Pagina2({super.key, this.numeroDeLados = ''});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(numeroDeLados),
        ),
      ),
    );
  }
}