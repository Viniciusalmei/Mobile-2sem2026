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
  List listaProdutos = [];

  @override 
  void initState() {
    super.initState();
    fazerGet();
  }

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

  void fazerGet() async {
    final respostaServidor = await http.get(Uri.parse("https://mercadinho-da-ds20.onrender.com/produtos"));
    if(respostaServidor.statusCode == 200){
      final dados = jsonDecode(respostaServidor.body);
      setState(() {
        listaProdutos = dados;
      });
    }else {
      if(mounted){ //Mounted verifica se a logica/tela foi totalmente montada antes de aparecer uma mensagem de erro
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Erro ao carregar dados!"))
        );
      }
    }
  }

  void fazerDelete(dynamic id) async {
    final respostaServidor = await http.delete(Uri.parse("https://mercadinho-da-ds20.onrender.com/produtos/$id"));
    if(respostaServidor.statusCode == 200){
      if(mounted){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Dado deletado com sucesso")));
        fazerGet();
        Navigator.pushNamed(context, "/navbar");
        }
    }else{
      if(mounted){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Falha ao deletar dado!")));
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Tela Gestão")),
      body:ListView(
        children: [
          TextField(controller: nomeDigitado,decoration: InputDecoration(hintText: "Insira o nome do produto"),),
          TextField(controller: urlDigitado,decoration: InputDecoration(hintText: "Insira a url do produto"),),
          TextField(controller: precoDigitado,decoration: InputDecoration(hintText: "Insira o preço do produto"),),
          TextButton(onPressed: fazerPost, child: Text("Salvar")),
          SizedBox(height: 100),
          Divider(indent: 15,endIndent: 15),
          for(final produto in listaProdutos)
          ListTile(
            title:Text(produto["nome"]),
            subtitle: Text(produto["preco"].toStringAsFixed(2)),
            trailing: IconButton(onPressed: ()=> fazerDelete(produto["id"]), icon: Icon(Icons.delete)),
          )
        ],
      )
    );
  }
}