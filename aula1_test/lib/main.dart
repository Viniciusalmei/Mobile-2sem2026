import 'package:aula1_test/navigation/navbar.dart';
import 'package:aula1_test/pages/telacolumn.dart';
import 'package:aula1_test/pages/telamix.dart';
import 'package:aula1_test/pages/telarow.dart';
import 'package:aula1_test/pages/telastack.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() { //funcao principal 
  runApp(const MyApp()); //funcao que roda o app 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(//Fornece os componentes para as telas & faz a configuração geral do app 
    initialRoute: "/", 
    routes: {
      "/": (context)=> NavBar(),
      "/column":(context)=> TelaColumn(),
      "/row":(context) => TelaRow(),
      "/stack":(context) => TelaStack(),
      "/mix":(context) => TelaMix()
    },
    theme: ThemeData(fontFamily: GoogleFonts.poppins().fontFamily),
    );
  }
}


