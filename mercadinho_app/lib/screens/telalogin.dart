import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mercadinho_app/components/inputlogin.dart'; //por exemplo: numpy as np / matplotlib.pyplot as plt 

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  TextEditingController emailDigitado = TextEditingController();
  TextEditingController senhaDigitada = TextEditingController();

  void fazerLogin()async {
    final respostaServidor = await http.get(Uri.parse("https://mercadinho-da-ds20.onrender.com/usuarios"));
    if(respostaServidor.statusCode == 200){
      final dados = jsonDecode(respostaServidor.body);
      for(final usuario in dados){
        if(usuario["email"] == emailDigitado.text && usuario["senha"] == senhaDigitada.text){
          usuarioId = usuario["id"];
          usuarioEmail = usuario["email"];
          statusAdmin = usuario["admin"];
          if(mounted){Navigator.pushNamed(context, "/navbar");}
        }
      }
    }
    else {
      if(mounted){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Usuário ou Senha Invalidos")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children: [
          InputLogin(fofoqueira: emailDigitado, placeholder: "Digite seu email"),
          InputLogin(fofoqueira: senhaDigitada, placeholder: "Digite sua senha", senha: true,),
          TextButton(onPressed: (){fazerLogin();}, child: Text("Logar"))
      ],))
    );
  }
}


dynamic usuarioId;
dynamic usuarioEmail;
bool? statusAdmin;

