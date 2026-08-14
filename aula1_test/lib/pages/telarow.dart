import 'package:flutter/material.dart';

class TelaRow extends StatelessWidget {
  const TelaRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Tela Row",style: TextStyle(color: Colors.white),),
      centerTitle: true,backgroundColor: Colors.black,),
      body: Center(
        child: Row(children: [
          Container(width: 20,height: 20,color: Colors.amber,),
          Container(width: 20,height: 20,color: Colors.blue,),
          Container(width: 20,height: 20,color: Colors.red,),
          TextButton(onPressed: () { Navigator.pushNamed(context,"/stack");},
          child: Text("Ir para Stack")),
        ],),
      ),
    );
  }
}