import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mercadinho_app/components/minha_app_bar.dart';
import 'package:mercadinho_app/components/produtos.dart';

class TelaHome extends StatefulWidget {
  const TelaHome({super.key});

  @override
  State<TelaHome> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  //Aqui voce coda a sua lógica 
  List produtos = [];
  
  @override
  void initState() {
    super.initState();
    fazerGet();
  }

  void fazerGet() async {
    //final é o tipo de variavel que começa nulo e depois recebe um valor, ideal para comunicação com API 
    final respostaServidor = await http.get(Uri.parse("https://mercadinho-da-ds20.onrender.com/produtos"));
    if(respostaServidor.statusCode == 200){
      final dados = jsonDecode(respostaServidor.body);
      setState(() {
        produtos = dados;
      });
    }else{
      if(mounted){ //Mounted verifica se a pagina foi montada antes de aparecer uma mensagem de falha.
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Falha na API!")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MinhaAppBar(),
      body:produtos.isEmpty? Center(child:Text("Carregando produtos.....")):
      GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      children: [
      for(final produto in produtos)
      ProdutosCard(nome: produto["nome"], preco: produto["preco"], urlImagem: produto["imagem"])
      ],
      )
    );
  }
}