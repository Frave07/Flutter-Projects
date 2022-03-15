
import 'package:flutter/material.dart';


class BackgroundSliver extends StatelessWidget {

  const BackgroundSliver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Positioned.fill(
      child: Image.asset(
        'Assets/scrollable/sushi.jpg',
        fit: BoxFit.cover,
        colorBlendMode: BlendMode.darken,
        color: Colors.black.withOpacity(.2),
      ),
    );
  }
}