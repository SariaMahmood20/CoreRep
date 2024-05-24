import 'package:flutter/material.dart';

class ExerciseOption extends StatelessWidget {
  const ExerciseOption(this.imageAddress, this.exerciseName, {key});
  final exerciseName;
  final imageAddress;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          exerciseName,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      )),
      height: 193,
      width: 368,
      margin: EdgeInsets.symmetric(vertical: 20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: NetworkImage(imageAddress),
            fit: BoxFit.fill,
          )),
    );
  }
}
