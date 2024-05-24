
import 'package:flutter/material.dart';
import '../Views/pose_detection_view.dart';


class Details extends StatelessWidget {
  const Details(this.exerciseName, this.exerciseDetails, this.imageAddress, {Key? key})
      : super(key: key);
  final exerciseName;
  final exerciseDetails;
  final imageAddress;

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          title: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              const Text(
                'Details', style: TextStyle( fontSize: 36,color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        body: Stack(
            children: <Widget>[

              // Add the background image

              const SizedBox(height: 20.0),
              Center(
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: <Widget>[
                        // Text elements
                        Container(
                          height: 193,
                          width: 368,
                          margin: EdgeInsets.symmetric(vertical: 20.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(image: AssetImage(imageAddress), fit: BoxFit.fill)
                          ),
                        ),
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
                              fontSize: 18.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
                      Icons.camera_alt_rounded,
                      color: Colors.white,
                    ),
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
