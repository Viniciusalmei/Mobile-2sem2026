import 'package:flutter/material.dart';

class InputLogin extends StatelessWidget {
  TextEditingController fofoqueira; 
  String placeholder;
  TextInputType? tipo;
  bool? senha;
  InputLogin({super.key, required this.fofoqueira, required this.placeholder, this.tipo =TextInputType.text, this.senha = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 40,vertical: 10),
      child: TextField(
        controller: fofoqueira,
        keyboardType: tipo,  //TextInputType.number
        obscureText: senha!,
        decoration: InputDecoration(
          filled: true, //esta preenchido?
          fillColor: Colors.white, //cor de preenchimento 
          hintText: placeholder,
          border: OutlineInputBorder(
           borderSide: BorderSide.none, //Tire a espessura da borda 
          )
        ),
      ),
    );
  }
}

//OutlineInputBorder é a borda arredondada 
//RoundedRectangleBorder é  borda retangulo