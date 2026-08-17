//estilo do texto 
//estilo de componente usamos final / estilo de cor usamos const

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

final titulo = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.bold,
  color: Colors.blue,
  fontFamily: GoogleFonts.poppins().fontFamily
);

final botao = TextButton.styleFrom(
  backgroundColor: Colors.blue,
  foregroundColor: Colors.white,
  fixedSize: Size(40,20)
);