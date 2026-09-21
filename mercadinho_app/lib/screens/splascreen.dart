import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //Aqui voce coda a lógica 
  @override
  void initState() {
  super.initState();
  Future.delayed( //Funcao FUTURA que espera um determinado tempo e depois realiza uma ação
    Duration(seconds: 4),
    (){Navigator.pushNamed(context,"/navbar");}
  );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children:[
        Image.network("https://static.vecteezy.com/ti/vetor-gratis/p1/78816939-laranja-compras-carrinho-icone-apresentando-uma-vibrante-verde-folha-representando-organico-supermercados-ecologico-varejo-lojas-e-sustentavel-natural-comida-comercio-gratis-vetor.jpg",width: 200),
        CircularProgressIndicator(color: Colors.orange,)
      ]))
    );
  }
}