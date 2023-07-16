import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  final Function()? onTap;
  final String text;
  const MyButton({key, required this.onTap, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(horizontal: 40),
        decoration: BoxDecoration(
            color: Colors.purpleAccent,
            borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
