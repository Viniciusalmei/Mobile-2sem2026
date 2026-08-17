import 'package:appcontador/screens/telacontador.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//Classe Mãe 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( //CupertinoApp --> Cara de IOS 
    initialRoute: "/",
    routes: {
      "/":(context) => TelaContador()
    },
    );
  }
}