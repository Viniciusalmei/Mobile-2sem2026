import 'package:flutter/material.dart';

class MinhaAppBar extends StatelessWidget implements PreferredSizeWidget{
  const MinhaAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        Text("Tela Home"),
        IconButton(onPressed: ()=> Navigator.pushNamed(context, "/gestao"), icon: Icon(Icons.settings))
      ],),
      automaticallyImplyLeading: false,
      backgroundColor: Colors.orange,
    );
  }

  @override 
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}