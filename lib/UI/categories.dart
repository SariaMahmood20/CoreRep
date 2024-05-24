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
            Text(
              'Categories',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                  ),
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
                  child: ExerciseOption('assets/images/pushupfirst.PNG', 'Push Ups'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Details('Push ups',
                                'Starting Position: Begin in a plank position with your hands placed slightly wider than shoulder-width apart, fingers pointing forward, and arms fully extended.\nMovement: Lower your body by bending your elbows while keeping your torso straight and core engaged. Aim to lower until your chest almost touches the ground.\nAngle Details: Your elbows should ideally form a 45-degree angle with your body when viewed from above. This ensures that the chest, shoulders, and triceps are effectively engaged.\nEnding Position: Push through your palms to extend your arms and return to the starting position, keeping your body in a straight line throughout the movement.\nRepetitions: Aim for a controlled movement, performing as many repetitions as your fitness level allows.', 'assets/images/pushupsfront.jpeg.jpg')));
                  },
                ),
                InkWell(
                  child:
                      ExerciseOption('assets/images/tricep.jpg', 'Tricep Pushback'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Details('Tricep Pushback', 'This exercise mainly targets triceps The angle at default of the exercise should be 90 degrees and at the workout position the angle should be 180 degrees', 'assets/images/tricepPushback.jpg')));
                  },
                ),
                InkWell(
                  child: ExerciseOption(
                      'assets/images/bicepCurlsfront.jpg', 'Bicep Curls'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Details('Bicep Curls',
                            'To perform the bicep curls you need to have a set of dumbles or some weight in your hands.\n As shown in the figure the movement for a bicep curl from default to working state position. \nThe main joints that are involved in a bicep curl are elbows and wrists and the main muscles are biceps short head and long head from which you will pull the weight.\n The angle between your forearms and biceps should be around 45 to 60 degrees'
                                ,'assets/images/bicepCurls.jpg'
                            )));
                  },
                ),
                InkWell(
                  child: ExerciseOption(
                      'assets/images/diamondpushupfront.jpg', 'Diamond Pushup'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Details('Diamond Pushup',
                                'Diamond pushup is almost the same as a classic pushup but its main functionality is to target the triceps.\n The angles for diamond pushup in default state should be 90 degrees and in workout state the angle should be around 45 to 55 degrees', 'assets/images/diamondPushup.jpg')));
                  },
                ),InkWell(
                  child: ExerciseOption(
                      'assets/images/squatsFront.jpg', 'Squats'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Details('Squats',
                                'Squats, a fundamental exercise without equipment, primarily target the quadriceps, hamstrings, and glutes, while also engaging the core and lower back muscles. Starting from an upright position with knees fully extended at an angle of 180 degrees, you lower your body by bending the knees and hips until the thighs are parallel to the ground, achieving a knee angle of approximately 90 degrees. Throughout the movement, ensure that your chest remains up, back neutral, and knees track over the toes without collapsing inward. Push through your heels to return to the starting position, effectively building lower body strength and stability.', 'assets/images/sq.jpg')));
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
