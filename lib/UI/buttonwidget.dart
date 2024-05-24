import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons(this.buttontext, this.SecondScreen, {key});
  final SecondScreen;
  final String buttontext;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 336,
      height: 55,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SecondScreen,
            ),
          );
        },
        child: Text(
          buttontext,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.black),
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
    );
  }
}
