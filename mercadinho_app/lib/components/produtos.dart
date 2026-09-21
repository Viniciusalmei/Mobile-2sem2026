import 'package:flutter/material.dart';
import 'package:mercadinho_app/screens/telacarrinho.dart';

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
          Text("R\$ ${preco.toString()}"),
          IconButton(onPressed:(){
           produtosCarrinho.add(ProdutosCard(nome: nome, preco: preco, urlImagem: urlImagem));
          }, icon: Icon(Icons.add))
        ],
      )
    );
  }
}