import 'package:flutter/material.dart';

class TelaStack extends StatelessWidget {
  const TelaStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tela Stack",style: TextStyle(color: Colors.white),),
      centerTitle: true,
      backgroundColor: Colors.black,),
      body: Center(child: Stack(
        alignment: Alignment.center,
        children: [
          Container(width: 120,height: 120,color: Colors.black,),
          Container(width: 60,height: 60,color: Colors.red,),
          Container(width: 40,height: 40,color: Colors.yellow,),
          TextButton(onPressed: () {
            Navigator.pushNamed(context, "/mix");
          }, child: Text("Ir Tela Mix"))
        ],
      ),),
    );
  }
}