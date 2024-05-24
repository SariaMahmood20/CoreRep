import 'package:newpr/Views/pose_detection_view.dart';

import 'package:flutter/material.dart';
import './exeriseOption.dart';
import './details.dart';

class Categories extends StatelessWidget {
  const Categories({key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              'Categories',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                  color: Colors.white),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            color: Colors.black,
            width: double.infinity,
            child: Column(
              children: [
                InkWell(
                  child: ExerciseOption('assets/images/squats.jpg', 'Squats'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Details('Push ups',
                                'Starting Position: Begin in a plank position with your hands placed slightly wider than shoulder-width apart, fingers pointing forward, and arms fully extended.\nMovement: Lower your body by bending your elbows while keeping your torso straight and core engaged. Aim to lower until your chest almost touches the ground.\nAngle Details: Your elbows should ideally form a 45-degree angle with your body when viewed from above. This ensures that the chest, shoulders, and triceps are effectively engaged.\nEnding Position: Push through your palms to extend your arms and return to the starting position, keeping your body in a straight line throughout the movement.\nRepetitions: Aim for a controlled movement, performing as many repetitions as your fitness level allows.')));
                  },
                ),
                InkWell(
                  child:
                      ExerciseOption('assets/images/deadlift.jpg', 'Deadlift'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PoseDetectorView()));
                  },
                ),
                InkWell(
                  child: ExerciseOption(
                      'assets/images/benchpress.jpg', 'Benchpress'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PoseDetectorView()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
