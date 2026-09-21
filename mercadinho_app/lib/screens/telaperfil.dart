import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mercadinho_app/components/inputlogin.dart';
import 'package:mercadinho_app/screens/telalogin.dart';
import 'package:http/http.dart' as http;

class TelaPerfil extends StatefulWidget {
  const TelaPerfil({super.key});

  @override
  State<TelaPerfil> createState() => _TelaPerfilState();
}

class _TelaPerfilState extends State<TelaPerfil> {
  TextEditingController emailDigitado = TextEditingController();

  @override
  void initState(){
  super.initState();
  emailDigitado.text = usuarioEmail;
  }

  void fazerPatch()async {
    final respostaServidor = await http.patch(Uri.parse("https://mercadinho-da-ds20.onrender.com/usuarios/$usuarioId"),
    headers: {"Content-Type":"application/json"},
    body:jsonEncode({
      "email": emailDigitado.text
    })
    );
    if(respostaServidor.statusCode == 200){
      setState(() {
        usuarioEmail = emailDigitado.text;
      });
      if(mounted){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Dado alterado com sucesso")));
      }
    }else {
      if(mounted){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Erro ao atualizar dados!")));
      }
    }
  }

  void finalizarSessao() {
    usuarioId = null; 
    usuarioEmail = null; 
    //usamos o pushAndRemoveUntil para apagar todas as rotas anteriores e criar um novo contexto.
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context)=> TelaLogin()), (route)=> false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Tela Perfil"),automaticallyImplyLeading: false),
      body:Center(child: 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 30,
        children: [
        Icon(Icons.person, size: 120),
        InputLogin(fofoqueira: emailDigitado, placeholder: "Digite o email"),
        TextButton(onPressed: (){fazerPatch();}, child: Text("Alterar")),
        TextButton(onPressed: (){finalizarSessao();}, child: Text("Sair"))
      ],))
    );
  }
}