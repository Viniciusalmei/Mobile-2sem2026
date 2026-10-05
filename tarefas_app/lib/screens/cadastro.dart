import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tarefas_app/screens/login.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  TextEditingController emailDigitado = TextEditingController();
  TextEditingController senhaDigitada = TextEditingController();

  void fazerCadastro() async {
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailDigitado.text.trim(), password: senhaDigitada.text.trim());

      if(mounted){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Usuario criado com sucesso")));
        Navigator.push(context,MaterialPageRoute(builder: (context)=>Login()));
      }
    } on FirebaseAuthException catch(e){
      String mensagemErro = "Erro ao criar usuario";
      if(e.code == "email-already-in-use"){
        mensagemErro ="Email ja está em uso";
      }else if(e.code == "invalid-email"){
        mensagemErro ="Email invalido";
      }else if(e.code == "weak-password"){
        mensagemErro == "Senha fraca, utilize no minimo 6 digitos!";
      }
      if(mounted){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(mensagemErro)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Cadastre-se",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
          TextField(controller:emailDigitado, decoration: InputDecoration(hintText: "Digite seu email"),),
          TextField(controller:senhaDigitada, decoration: InputDecoration(hintText: "Digite sua senha"),),
          TextButton(onPressed: (){fazerCadastro();}, child: Text("Cadastrar"))
        ],
      ))
    );
  }
}