import 'package:aula1_test/style/geral.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//shift+alt+setinha pra baixo 
class TelaColumn extends StatelessWidget {
  const TelaColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Tela Column",style:titulo),
      backgroundColor: Colors.black,
      centerTitle: true,
      ),
      body:Center(child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing:20,
        children: [
        Container(width: tamanho,height: tamanho,color: Colors.blue,),
        Container(width: tamanho,height: tamanho,color: Colors.yellow,),
        Container(width: tamanho,height: tamanho,color: Colors.red,),
        TextButton(
          style: estiloBotao,
          onPressed:(){
          Navigator.pushNamed(context,"/row");
        }, child:Text("Clique Aqui -> Row"))
      ],))
    );
  }
}