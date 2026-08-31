import 'package:flutter/material.dart';
import 'package:netflix_app/components/imagemlogo.dart';

//Para criarmos um componente da appbar falamos que ela é um filho preferido 
//Seu tamanho implica no tamanho do body 

class MinhaAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MinhaAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        IconButton(onPressed:()=>Navigator.pushNamed(context,"/") ,icon:Icon(Icons.arrow_back) ,color: Colors.white),
        ImagemLogo(),
        IconButton(onPressed:()=>Navigator.pushNamed(context,"/novofilme") ,icon:Icon(Icons.add) ,color: Colors.white),
      ],),
      backgroundColor: Colors.black,
      automaticallyImplyLeading: false,//Tira o icone de voltar padrao
      toolbarHeight: 150,
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}