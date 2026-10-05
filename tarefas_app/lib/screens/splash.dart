import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState(){
    super.initState();

    Future.delayed(Duration(seconds: 4),
    (){
      if(mounted){Navigator.pushNamed(context,"/login");}
      }
    );

  }
  
  @override
  Widget build(BuildContext context) {
    return Center(child:Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
      Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7ExQl_KfK3TQLHUHKYDIKubvm1BcE6-9LIdtMr52ocA&s=10",width: 100),
      CircularProgressIndicator(color: Colors.blue,)
    ]));
  }
}