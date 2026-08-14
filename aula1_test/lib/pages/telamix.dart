import 'package:flutter/material.dart';

class TelaMix extends StatelessWidget {
  const TelaMix({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Tela Mix")),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 30,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.network("https://purina.com.br/sites/default/files/2024-08/racas-cachorros-porte-medio-beagle-br.jpg",width: double.infinity,height: 200),
              Container(width:100,height: 80,color: Colors.blue,),
              Text("Meu Perfil")
            ],
          ),
          Text("Atalho",style:TextStyle(fontFamily: "rubik")),
          Row(
            spacing: 30,
            children: [
            Icon(Icons.menu_book),
            Text("Aulas")
          ],),

          Text("Conteúdo"),
          Row(
            spacing: 30,
            children: [
            Image.asset("assets/doberman-p.png",width: 100,),
            Text("Introdução a Flutter")
          ],)


        ],
      )
    );
  }
}