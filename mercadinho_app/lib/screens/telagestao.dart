import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TelaGestao extends StatefulWidget {
  const TelaGestao({super.key});

  @override
  State<TelaGestao> createState() => _TelaGestaoState();
}

class _TelaGestaoState extends State<TelaGestao> {
  TextEditingController nomeDigitado = TextEditingController();
  TextEditingController urlDigitado = TextEditingController();
  TextEditingController precoDigitado = TextEditingController();

  void fazerPost() async {
    final respostaServidor = await http.post(Uri.parse("https://mercadinho-da-ds20.onrender.com/produtos"),
    headers: {"Content-Type":"application/json"},
    body: jsonEncode({
      "nome": nomeDigitado.text,
      "imagem":urlDigitado.text, 
      "preco":double.parse(precoDigitado.text)
    })
    );

    if(mounted){
    if(respostaServidor.statusCode == 201){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Produto Criado com Sucesso Champion!"))
      );
      Navigator.pushNamed(context, "/navbar");
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erro ao criar Produto, tente Novamente!",style:TextStyle(color: Colors.white)), backgroundColor: Colors.red,)
      );
    }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Tela Gestão")),
      body:Column(
        children: [
          TextField(controller: nomeDigitado,decoration: InputDecoration(hintText: "Insira o nome do produto"),),
          TextField(controller: urlDigitado,decoration: InputDecoration(hintText: "Insira a url do produto"),),
          TextField(controller: precoDigitado,decoration: InputDecoration(hintText: "Insira o preço do produto"),),
          TextButton(onPressed: fazerPost, child: Text("Salvar"))
        ],
      )
    );
  }
}