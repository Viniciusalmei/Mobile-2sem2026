import 'package:flutter/material.dart';
import 'package:netflix_app/components/minhaappbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TelaHome extends StatefulWidget {
  const TelaHome({super.key});

  @override
  State<TelaHome> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  //Codamos a logica aqui
  List<String> mostrarFilmes = [];

  @override
  void initState() { //Funcao que carrega uma outra função quando a tela abre
  super.initState();
  carregarFilmes();
  }

  //Toda vez que uma função busca um dado de outra plataforma use uma função ASYNC
  void carregarFilmes() async {
  SharedPreferences banco = await SharedPreferences.getInstance();
  List<String> filmesBanco = banco.getStringList("filmes") ?? [];
  setState(() {
    mostrarFilmes = filmesBanco;
  });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MinhaAppBar(),
      body: mostrarFilmes.isEmpty ? Center(child:Text("Não tem filmes")) :
      GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: [
          for(String filme in mostrarFilmes)
          Column(children: [
            Image.network(filme.split("|")[3]),
            Text(filme.split("|")[0])
          ],)
        ],
      )
    );
  }
}