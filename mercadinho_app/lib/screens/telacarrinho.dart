import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mercadinho_app/screens/telalogin.dart';
class TelaCarrinho extends StatefulWidget {
  const TelaCarrinho({super.key});

  @override
  State<TelaCarrinho> createState() => _TelaCarrinhoState();
}

class _TelaCarrinhoState extends State<TelaCarrinho> {
  int quantidade = 1; 
  double total = 0;

  void aumentar() {
    setState(() {
      quantidade++;
    });
  }

  void diminuir() {
    setState(() {
      quantidade--;
    });
  }

  double somarTotal() {
    for(dynamic produto in produtosCarrinho){
      total += produto.preco * quantidade; 
    }return total;
  }

  void fazerPost() async {
    dynamic itensPedido = produtosCarrinho.map((produto){
      return {
        "Nome do produto":produto.nome,
        "quantidade": quantidade
      };
    }).toList();
    
    final respostaServidor = await http.post(Uri.parse("https://mercadinho-da-ds20.onrender.com/pedidos"),
    headers: {"Content-Type":"application/json"},
    body: jsonEncode({
      "usuarioId":usuarioId,
      "total": total,
      "itens": itensPedido
    })
    );

    if(respostaServidor.statusCode == 201){
      if(mounted){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Dado criado com sucesso")));
        setState(() {
          produtosCarrinho.clear();
          quantidade = 0;
        });
        
      }
    }else {
      if(mounted){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Erro ao criar pedido")));
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Tela Carrinho"),automaticallyImplyLeading: false),
      body:produtosCarrinho.isEmpty ? Center(child:Text("Adicione Produtos na tela Home \n Carrinho Vazio!")) :
      ListView(
        children: [
          for(final produto in produtosCarrinho)
          ListTile(
            leading: Image.network(produto.urlImagem), 
            title:Text(produto.nome),
            subtitle: Text(produto.preco.toString()),
            trailing: Row(mainAxisSize: MainAxisSize.min, children: [
              IconButton(onPressed: (){
                setState(() {
                produtosCarrinho.remove(produto);
                },);
              }, icon: Icon(Icons.delete)),
              IconButton(onPressed: (){diminuir();}, icon: Icon(Icons.remove)),
              Text(quantidade.toString()),
              IconButton(onPressed: (){aumentar();},icon:Icon(Icons.add))
            ],)
          ),
          Text("Total da sua compra ${somarTotal().toStringAsFixed(2)}"),
          TextButton(onPressed: (){fazerPost();},child:Text("Salvar"))
        ],
      )
    );
  }
}

List produtosCarrinho = [];