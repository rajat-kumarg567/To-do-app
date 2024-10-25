import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  VoidCallback onPressed;
  final String text;
   MyButton({super.key,required this.text,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
       color: Colors.yellow[200],
        child: Text(text),
        onPressed: onPressed);

  }
}
