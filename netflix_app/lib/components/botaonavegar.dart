import 'package:flutter/material.dart';

class BotaoNavegar extends StatelessWidget {
  Function funcao;
  String textobotao;

  BotaoNavegar({super.key,required this.funcao, this.textobotao="Navegar"});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        fixedSize: Size(120,40), //tamanho do botao 
        backgroundColor: Colors.red, //cor de fundo 
        foregroundColor: Colors.white,//cor do texto
      ),
      onPressed:() {funcao();},
      child:Text(textobotao)
    );
  }
}