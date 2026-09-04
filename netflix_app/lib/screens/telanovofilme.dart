import 'package:flutter/material.dart';
import 'package:netflix_app/components/botaonavegar.dart';
import 'package:netflix_app/components/meutextfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TelaNovoFilme extends StatefulWidget {
  const TelaNovoFilme({super.key});

  @override
  State<TelaNovoFilme> createState() => _TelaNovoFilmeState();
}

class _TelaNovoFilmeState extends State<TelaNovoFilme> {
  TextEditingController nomeFilme = TextEditingController();
  TextEditingController anoFilme = TextEditingController();
  TextEditingController descricaoFilme = TextEditingController();
  TextEditingController imagemFilme = TextEditingController();

  void salvarDados() async {
    SharedPreferences banco = await SharedPreferences.getInstance();
    String filme = "${nomeFilme.text}|${anoFilme.text}|${descricaoFilme.text}|${imagemFilme.text}";
    List<String> lista = banco.getStringList("filmes") ?? [];
    lista.add(filme);
    await banco.setStringList("filmes", lista);
    Navigator.pushNamed(context,"/home"); //Volta na tela anterior
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title:Text("Criar Filme",style: TextStyle(color: Colors.white),),backgroundColor: Colors.black,),
    body: Center(child:Column(
      children: [
        MeuTextField(controlador: nomeFilme, tipo: " nome do filme"),
        MeuTextField(controlador: anoFilme, tipo: " ano do filme"),
        MeuTextField(controlador: descricaoFilme, tipo: " descricao do filme"),
        MeuTextField(controlador: imagemFilme, tipo: " imagem do filme"),
        BotaoNavegar(funcao: salvarDados,textobotao: "Salvar Filme")
      ],
    ))
    );
  }
}