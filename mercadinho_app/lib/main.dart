import 'package:flutter/material.dart';
import 'package:mercadinho_app/navigation/navbar.dart';
import 'package:mercadinho_app/screens/splascreen.dart';
import 'package:mercadinho_app/screens/telagestao.dart';
import 'package:mercadinho_app/screens/telahome.dart';
import 'package:mercadinho_app/screens/telalogin.dart';
import 'package:mercadinho_app/screens/telaperfil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes:{
        "/":(context) => SplashScreen(),
        "/home":(context)=> TelaHome(),
        "/perfil":(context)=> TelaPerfil(),
        "/navbar":(context)=> NavBar(),
        "/login":(context)=> TelaLogin()
      },
      onGenerateRoute: (settings){
        if(settings.name == "/gestao"){
          if(statusAdmin != null && statusAdmin == true){
            return MaterialPageRoute(builder:(context)=> TelaGestao());
          }else{
            return MaterialPageRoute(builder:(context)=> NavBar());
          }
        }
      },
    );
  }
}