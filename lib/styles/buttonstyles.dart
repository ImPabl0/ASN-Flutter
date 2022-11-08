import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Color color;
  final VoidCallback? onPressed;
  final double radius;
  final String text;
  const Button(
      {super.key,
      required this.text,
      required this.color,
      required this.onPressed,
      required this.radius});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(color),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius))),
            minimumSize: MaterialStatePropertyAll(Size(double.infinity, 40))));
  }
}
