import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newpr/firebase_options.dart';
import './UI/splashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const CoreRep());
}

class CoreRep extends StatelessWidget {
  const CoreRep({super.key});
  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      home: SplashPage(),
    );
  }
}
