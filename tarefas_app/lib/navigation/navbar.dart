import 'package:flutter/material.dart';
import 'package:tarefas_app/screens/chatbot.dart';
import 'package:tarefas_app/screens/tarefas.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int indexAtual = 0;

  void mudarIndex(int novoIndex){
    setState(() {
      indexAtual = novoIndex;
    });
  }

  List telas = [
    Tarefas(),
    ChatBot()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:telas.elementAt(indexAtual),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(label:"Tarefas", icon: Icon(Icons.task)),
        BottomNavigationBarItem(label:"ChatBot", icon: Icon(Icons.smart_toy)),
      ],
      currentIndex: indexAtual,
      onTap: mudarIndex,
      ),
    );
  }
}