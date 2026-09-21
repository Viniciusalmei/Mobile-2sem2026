import 'package:flutter/material.dart';
import 'package:mercadinho_app/screens/telahome.dart';
import 'package:mercadinho_app/screens/telaperfil.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  //Aqui codamos a nossa lógica 
  int indexAtual = 0;

  void mudarIndex(int novoIndex){
    setState(() {
      indexAtual = novoIndex;
    });
  }

  List<Widget> paginas = [
    TelaHome(),
    TelaPerfil()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:paginas.elementAt(indexAtual),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label:"Home"),
        BottomNavigationBarItem(icon: Icon(Icons.person),label:"Perfil"),
      ],
      currentIndex: indexAtual,
      onTap:mudarIndex,
      backgroundColor: Colors.orange,
      selectedItemColor: Colors.white,
      ),
    );
  }
}