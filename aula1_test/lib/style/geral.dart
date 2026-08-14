import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


//Cores do meu aplicativo 
const corPrimaria = Color(0XFF387464);
const corSecundaria = Color(0XFF213672);

//tamanho do container 
const tamanho = 20.0;

//estilos de textos 
final titulo = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.bold,
  color: corPrimaria,
  fontFamily: GoogleFonts.roboto().fontFamily
);

//Utilizamos final para estilos de componentes, porque o aplicativo vai verificar 
//se o componente existe e depois aplica a estilização.

final estiloBotao = TextButton.styleFrom(
  fixedSize: Size(50,70),
  backgroundColor: Colors.blue,
  foregroundColor: Colors.white,
);