import 'package:aula1_test/pages/telacolumn.dart';
import 'package:aula1_test/pages/telamix.dart';
import 'package:aula1_test/pages/telarow.dart';
import 'package:aula1_test/pages/telastack.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  //Aqui voce coda a sua lógica 
  int index = 0;

  List telas = [
    TelaColumn(),
    TelaRow(),
    TelaStack(),
    TelaMix()
  ];

  void mudarIndex(int indexNovo){
    setState(() {
      index = indexNovo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:telas.elementAt(index),
      bottomNavigationBar: BottomNavigationBar(items:[
        BottomNavigationBarItem(icon: Icon(Icons.view_agenda), label: "Column"),
        BottomNavigationBarItem(icon: Icon(Icons.view_column), label: "Row"),
        BottomNavigationBarItem(icon: Icon(Icons.layers), label: "Stack"),
        BottomNavigationBarItem(icon: Icon(Icons.widgets), label: "Mix"),
      ],
      currentIndex: index, //Fala qual é o index atual para abrir a pagina
      onTap: mudarIndex, //Funcao para mudar o index
      type: BottomNavigationBarType.fixed //Tira o aviso de limite de botões
      ),

    );
  }
}