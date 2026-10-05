import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Tarefas extends StatefulWidget {
  const Tarefas({super.key});

  @override
  State<Tarefas> createState() => _TarefasState();
}

class _TarefasState extends State<Tarefas> {
  List tarefas = [];
  TextEditingController nomeDigitado = TextEditingController();
  //Crio um Map pois para cada ID de tarefas eu preciso de um TextEditingControllerDiferente
  Map<String,TextEditingController> controladoresEdicao = {};  

  @override
  void initState() {
  super.initState();
  fazerGet();
  }

  void fazerGet() async {
    //Chamo a biblioteca que abre uma instancia do banco, na coleção "tarefas"
    //os retornos instantaneos do banco eu vou ouvir.
    FirebaseFirestore.instance.collection("tarefas").snapshots().listen(
      (snapshot){
        final dados = snapshot.docs;
        for(dynamic doc in dados){
          controladoresEdicao[doc.id] = TextEditingController();
        }
        setState(() {
          tarefas = dados;
        });
      }
    );
  }

  void fazerDelete(dynamic id) async {
    FirebaseFirestore.instance.collection("tarefas").doc(id).delete();
  }

  void fazerPost() async {
    FirebaseFirestore.instance.collection("tarefas").add({
      "nome": nomeDigitado.text,
    });
  }


  void fazerPut(dynamic id) async {
    FirebaseFirestore.instance.collection("tarefas").doc(id).update({
      "nome":controladoresEdicao[id]!.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Tarefas")),
      body: tarefas.isEmpty ? Center(child: Column(children: [
          Text("Crie suas tarefas aqui"),
          TextField(controller: nomeDigitado,),
          TextButton(onPressed: (){fazerPost();},child: Text("Criar"),),
      ],)) : 
      ListView(
        children: [
          Text("Crie suas tarefas aqui"),
          TextField(controller: nomeDigitado,),
          TextButton(onPressed: (){fazerPost();},child: Text("Criar"),),
          for(dynamic tarefa in tarefas)
          ListTile(title: Text(tarefa["nome"]),
          subtitle: TextField(controller:controladoresEdicao[tarefa.id] ,decoration: InputDecoration(contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8))),
          trailing:Row(mainAxisSize:MainAxisSize.min, children: [
          IconButton(onPressed:(){fazerPut(tarefa.id);}, icon: Icon(Icons.edit)),
          IconButton(onPressed:(){fazerDelete(tarefa.id);}, icon: Icon(Icons.delete)),
          ],))
        ],
      )
    );
  }
}