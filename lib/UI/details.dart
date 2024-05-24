
import 'package:flutter/material.dart';
import '../Views/pose_detection_view.dart';


class Details extends StatelessWidget {
  const Details(this.exerciseName, this.exerciseDetails, {Key? key})
      : super(key: key);
  final exerciseName;
  final exerciseDetails;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  Stack(
          children: <Widget>[
            // Add the background image
            Container(
              decoration: BoxDecoration(
                  // image: DecorationImage(
                  // image: AssetImage('assets/images/benchpressContent.jpg'),
                  // fit: BoxFit.cover,
                  ),
            ),
            const SizedBox(height: 20.0),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Text elements
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text(
                        exerciseName,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text(
                        exerciseDetails,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PoseDetectorView(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.camera,
                  color: Colors.white,
                ),
              ),
            ),
            //height: double.infinity,
            //width: double.infinity,
          ],
        ),
      
    );
  }
}
