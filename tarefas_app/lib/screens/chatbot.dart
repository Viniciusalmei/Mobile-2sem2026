import 'package:firebase_ai/firebase_ai.dart';
import 'package:flutter/material.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  TextEditingController mensagemDigitada = TextEditingController();

  List<Map<String,String>> conversa = [];

  void enviarMensagem() async {
    try{
      setState(() {
        conversa.add({"remetente":"usuario", "texto":mensagemDigitada.text});
      });
      //Crio o modelo de IA
      dynamic modelo = FirebaseAI.googleAI().generativeModel(model: 'gemini-3.8-flash');
      //Crio um conteudo com base na mensagem digitada
      dynamic resposta = await modelo.generateContent([Content.text(mensagemDigitada.text)]);
      setState(() {
        conversa.add({"remetente":"gemini", "texto":resposta.text});
      });
    } catch(e){ //Caso tenha erro, a resposta do gemini é o erro de referencia.
      setState(() {
      conversa.add({"remetente":"gemini", "texto":"$e"});        
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: ListView.builder(itemCount: conversa.length,itemBuilder:(context, index) {
          dynamic mensagem = conversa[index];
          dynamic ehUsuario = mensagem["remetente"] == "usuario";
          return Align(
            alignment: ehUsuario ? Alignment.centerRight : Alignment.centerLeft,
            child:Container(width: 200,height: 200,color: const Color.fromARGB(255, 207, 200, 200),child:Text(mensagem["texto"]))
          );
          },)),
          Row(
            children: [
              Expanded(child: TextField(controller: mensagemDigitada)),
              TextButton(onPressed: (){enviarMensagem();}, child: Text("Enviar"))
            ],
          )
        ],
      ),
    );
  }
}