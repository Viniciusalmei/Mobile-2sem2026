import 'package:appcontador/styles/geral.dart';
import 'package:flutter/material.dart';

//Quando a tela depende de um valor de outra tela para iniciar
class TelaContador extends StatefulWidget {
  const TelaContador({super.key});

  @override
  State<TelaContador> createState() => _TelaContadorState();
}

//A lógica interna da tela
class _TelaContadorState extends State<TelaContador> {
  //Code a sua lógica interna aqui
  int numero = 0;
  int indexFrase = 0;
  List frases = ["Projetinho da Area", "Hackaton d+", "Salus", "TCC"];

  void mudarFrase() {
    if (indexFrase < frases.length - 1) {
      setState(() {
        indexFrase++;
      });
    } else {
      setState(() {
        indexFrase = 0;
      });
    }
  }

  void adicionar() {
    setState(() {
      numero++;
    });
  }

  void diminuir() {
    setState(() {
      numero--;
    });
  }

  void resetar() {
    setState(() {
      numero = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '''Tela Contadorssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
          ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss''',
        ),
      ),
      body: Column(
        spacing: 80,
        children: [
          Text("Flutter Contador", style: titulo),
          Text("$numero"),
          Row(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                style: botao,
                onPressed: adicionar,
                child: Icon(Icons.add),
              ),
              TextButton(
                style: botao,
                onPressed: diminuir,
                child: Icon(Icons.remove),
              ),
              TextButton(
                style: botao,
                onPressed: resetar,
                child: Icon(Icons.restore),
              ),
            ],
          ),
          Text(frases[indexFrase]),
          TextButton(style: botao, onPressed: mudarFrase, child: Text("Next")),
        ],
      ),
    );
  }
}

//ListView faz a rolagem de tela
