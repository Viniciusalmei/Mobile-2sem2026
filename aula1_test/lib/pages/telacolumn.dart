import 'package:flutter/material.dart';
//shift+alt+setinha pra baixo 
class TelaColumn extends StatelessWidget {
  const TelaColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Tela Column",style:TextStyle(color: Colors.white)
      ),
      backgroundColor: Colors.black,
      centerTitle: true,
      ),
      body:Center(child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing:20,
        children: [
        Container(width: 20,height: 20,color: Colors.blue,),
        Container(width: 20,height: 20,color: Colors.yellow,),
        Container(width: 20,height: 20,color: Colors.red,),
        TextButton(onPressed:(){
          Navigator.pushNamed(context,"/row");
        }, child:Text("Clique Aqui -> Row"))
      ],))
    );
  }
}