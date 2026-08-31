import 'package:flutter/material.dart';

class ImagemLogo extends StatelessWidget {
  const ImagemLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network("https://pngpix.com/images/hd/netflix-logo-redon-black-fqwt81hprrz7xsfg.jpg",width: 100);
  }
}