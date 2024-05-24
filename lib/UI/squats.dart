import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './exeriseOption.dart';

class Info extends StatelessWidget {
  const Info(this.imageAddress, this.textQuestion, this.textSolution,
      this.exerciseName,
      {key});
  final imageAddress;

  final textQuestion;
  final textSolution;
  final exerciseName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            Text(
              exerciseName,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 36),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: Colors.black,
          child: Column(
            children: [
              ExerciseOption(imageAddress, exerciseName),
              const SizedBox(
                height: 18,
              ),
              Text(
                textQuestion,
                style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(textSolution,
                  style: const TextStyle(
                    fontWeight: FontWeight.w100,
                    color: Colors.white,
                    fontSize: 20,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
