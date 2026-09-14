import 'package:flutter/material.dart';

class ProdutosCard extends StatelessWidget {
  String nome; 
  double preco;
  String urlImagem;
  ProdutosCard({super.key,required this.nome, required this.preco, required this.urlImagem});

  @override
  Widget build(BuildContext context) {
    return Card(
      child:Column(
        children: [
          Image.network(urlImagem,width: 100,height: 100,),
          Text(nome,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
          Text("R\$ ${preco.toString()}")
        ],
      )
    );
  }
}