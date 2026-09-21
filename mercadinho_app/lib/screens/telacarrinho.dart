import 'package:flutter/material.dart';

class TelaCarrinho extends StatefulWidget {
  const TelaCarrinho({super.key});

  @override
  State<TelaCarrinho> createState() => _TelaCarrinhoState();
}

class _TelaCarrinhoState extends State<TelaCarrinho> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Tela Carrinho"),automaticallyImplyLeading: false),
      body:produtosCarrinho.isEmpty ? Center(child:Text("Adicione Produtos na tela Home \n Carrinho Vazio!")) :
      ListView(
        children: [
          for(final produto in produtosCarrinho )
          ListTile(
            leading: Image.network(produto.urlImagem), 
            title:Text(produto.nome),
            subtitle: Text(produto.preco.toString()),
          )
        ],
      )
    );
  }
}

List produtosCarrinho = [];