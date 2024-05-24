import 'package:flutter/material.dart';
import 'package:newpr/Registration/authPage.dart';
import 'package:newpr/UI/buttonwidget.dart';

class StartingSScreen extends StatelessWidget {
  const StartingSScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/screen.jpg'),
                  fit: BoxFit.cover)),
          child: Center(
            child: Buttons(
              'Start Now',
              AuthPage(),
            ),
          ),
        ),
      ),
    );
  }
}
