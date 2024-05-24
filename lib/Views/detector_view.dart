import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_commons/google_mlkit_commons.dart';
import 'package:newpr/Models/push_up_model.dart';
import '../Painters/pose_painter.dart';
import 'package:bloc/bloc.dart' as bloc;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'camera_view.dart';
import './galleryview.dart';

enum DetectorViewMode { liveFeed, gallery }

class DetectorView extends StatefulWidget {
  DetectorView({
    Key? key,
    required this.posePainter,
    required this.title,
    required this.onImage,
    this.customPaint,
    this.text,
    this.initialDetectionMode = DetectorViewMode.liveFeed,
    this.initialCameraLensDirection = CameraLensDirection.back,
    this.onCameraFeedReady,
    this.onDetectorViewModeChanged,
    this.onCameraLensDirectionChanged,
  }) : super(key: key);
  final PosePainter? posePainter;
  final String title;
  final CustomPaint? customPaint;
  final String? text;
  final DetectorViewMode initialDetectionMode;
  final Function(InputImage inputImage) onImage;
  final Function()? onCameraFeedReady;
  final Function(DetectorViewMode mode)? onDetectorViewModeChanged;
  final Function(CameraLensDirection direction)? onCameraLensDirectionChanged;
  final CameraLensDirection initialCameraLensDirection;

  @override
  State<DetectorView> createState() => _DetectorViewState();
}

class _DetectorViewState extends State<DetectorView> {
  late DetectorViewMode _mode;

  @override
  void initState() {
    _mode = widget.initialDetectionMode;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return _mode == DetectorViewMode.liveFeed
    //     ?
           return MaterialApp(
             home: BlocProvider<ExerciseCounter>(
           create: (context) => ExerciseCounter(),
             child: CameraView(
               posePainter: widget.posePainter,
               customPaint: widget.customPaint,
               onImage: widget.onImage,
               onCameraFeedReady: widget.onCameraFeedReady,
               onDetectorViewModeChanged: _onDetectorViewModeChanged,
               initialCameraLensDirection: widget.initialCameraLensDirection,
               onCameraLensDirectionChanged: widget.onCameraLensDirectionChanged,
             ),
             ),
           );
        // : GalleryView(
        //     title: widget.title,
        //     text: widget.text,
        //     onImage: widget.onImage,
        //     onDetectorViewModeChanged: _onDetectorViewModeChanged);
  }

  void _onDetectorViewModeChanged() {
    if (_mode == DetectorViewMode.liveFeed) {
      _mode = DetectorViewMode.gallery;
    } else {
      _mode = DetectorViewMode.liveFeed;
    }

    setState(() {});
  }
}
