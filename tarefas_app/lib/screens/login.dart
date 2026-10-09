import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailDigitado = TextEditingController();
  TextEditingController senhaDigitada = TextEditingController();

  void fazerLogin() async {
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailDigitado.text.trim(), password: senhaDigitada.text.trim());
      if(mounted){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login realizado com sucesso")));
        Navigator.pushNamed(context, "/navbar");
      }
    } on FirebaseAuthException catch(e){
      String mensagemErro = "Erro ao realizar login";
      if(e.code == "invalid-email"){
        mensagemErro = "Email invalido";
      }else if(e.code == "wrong-password"){
        mensagemErro = "Senha incorreta";
      }
      if(mounted){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(mensagemErro)));
      }

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Icon(Icons.person, color: Colors.blue,size: 100),
        TextField(controller: emailDigitado, decoration: InputDecoration(hintText: "Insira seu email"),),
        TextField(controller: senhaDigitada, decoration: InputDecoration(hintText: "Insira sua senha"),),
        TextButton(onPressed: (){fazerLogin();}, child: Text("Logar")),
        TextButton(onPressed: (){Navigator.pushNamed(context, "/cadastro");}, child: Text("Cadastrar")),
        ],
      ))
    );
  }
}