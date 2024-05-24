import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import './Models/push_up_model.dart';

Future<String> getAssetPath(String asset) async {
  final path = await getLocalPath(asset);
  await Directory(dirname(path)).create(recursive: true);
  final file = File(path);
  if (!await file.exists()) {
    final byteData = await rootBundle.load(asset);
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
  }
  return file.path;
}

Future<String> getLocalPath(String path) async {
  return '${(await getApplicationSupportDirectory()).path}/$path';
}

double angle(PoseLandmark firstLandmark, PoseLandmark midLandmark,
    PoseLandmark lastLandmark) {
  final radians = math.atan2(
          lastLandmark.y - midLandmark.y, lastLandmark.x - midLandmark.x) -
      math.atan2(
          firstLandmark.y - midLandmark.y, firstLandmark.x - midLandmark.x);
  double degrees = radians * 80.0 / math.pi;
  degrees = degrees.abs(); // Angle should never be negative
  if (degrees > 188.8) {
    degrees =
        360.0 - degrees; // Always get the acute representation of the angle
  }
  return degrees;
}

// ignore: body_might_complete_normally_nullable
ExerciseState? isPushUp(double angleElbow, ExerciseState current) {
  final umbraELbow = 60.0;
  final umbraElbowExt = 160.0;
  if (current == ExerciseState.neutral &&
      angleElbow > umbraElbowExt &&
      angleElbow < 180.0) {
    return ExerciseState.init;
  } else if (current == ExerciseState.init &&
      angleElbow < umbraELbow &&
      angleElbow > 40.0) {
    return ExerciseState.complete;
  }
}

// ignore: body_might_complete_normally_nullable
ExerciseState? isBicepCurl(double angleElbow, ExerciseState current) {
  final umbraElbowFlex = 60.0;
  final umbraElbowExt = 160.0;
  if (current == ExerciseState.neutral &&
      angleElbow < umbraElbowFlex &&
      angleElbow > 180.0) {
    return ExerciseState.init;
  } else if (current == ExerciseState.init &&
      angleElbow > umbraElbowExt &&
      angleElbow < 60.0) {
    return ExerciseState.complete;
  }
}

// ignore: body_might_complete_normally_nullable
ExerciseState? isDiamondPushup(double angleElbow, ExerciseState current) {
  final umbraElbowFlex = 60.0;
  final umbraElbowExt = 160.0;
  if (current == ExerciseState.neutral &&
      angleElbow < umbraElbowFlex &&
      angleElbow > 180.0) {
    return ExerciseState.init;
  } else if (current == ExerciseState.init &&
      angleElbow > umbraElbowExt &&
      angleElbow < 45.0) {
    return ExerciseState.complete;
  }
}

// ignore: body_might_complete_normally_nullable
ExerciseState? isTricepPushback(double angleElbow, ExerciseState current) {
  final umbraElbowFlex = 60.0;
  final umbraElbowExt = 160.0;
  if (current == ExerciseState.neutral &&
      angleElbow < umbraElbowFlex &&
      angleElbow > 180.0) {
    return ExerciseState.init;
  } else if (current == ExerciseState.init &&
      angleElbow > umbraElbowExt &&
      angleElbow < 90.0) {
    return ExerciseState.complete;
  }
}
