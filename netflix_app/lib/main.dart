import 'package:flutter/material.dart';
import 'package:netflix_app/screens/teladetalhes.dart';
import 'package:netflix_app/screens/telahome.dart';
import 'package:netflix_app/screens/telalogin.dart';
import 'package:netflix_app/screens/telanovofilme.dart';

void main() {
  runApp(const MyApp());
}

//Classe Mãe Centralizadora 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/":(context) => TelaLogin(),
        "/home":(context) => TelaHome(),
        "/novofilme":(context)=> TelaNovoFilme(),
        "/detalhes":(context)=> TelaDetalhes()
      },
    );
  }
}