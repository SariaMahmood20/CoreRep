import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../UI/Buttons.dart';
import '../UI/txtField.dart';
import '../Registration/warning.dart';

// ignore: must_be_immutable
class RegisterPage extends StatefulWidget {
  void Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController userEditController = TextEditingController();

  TextEditingController emailEditController = TextEditingController();

  TextEditingController passwordEditController = TextEditingController();

  TextEditingController confirmPasswordEditController = TextEditingController();

  void register() async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    //match password
    if (passwordEditController.text != confirmPasswordEditController.text) {
      Navigator.pop(context);
      displayMessage("Password not match!", context);
    }

    //

    try {
      UserCredential? userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailEditController.text,
              password: passwordEditController.text);

      createUserDocument(userCredential);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayMessage(e.code, context);
    }
  }

  Future<void> createUserDocument(UserCredential? userCredential) async {
    if (userCredential != null && userCredential.user != null) {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(userCredential.user!.email)
          .set({
        'email': userCredential.user!.email,
        'username': userEditController.text,
        'uid': userCredential.user!.uid,
        'userEmail': userCredential.user!.email,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: Center(
        child: Container(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Text("C O R E R E P",
                        style: Theme.of(context).textTheme.headlineLarge),
                    SizedBox(
                      height: 50,
                    ),
                    TxtField(
                        hint: "NoobMaster",
                        label: "Username",
                        obscureText: false,
                        controller: userEditController),
                    SizedBox(
                      height: 10,
                    ),
                    TxtField(
                        hint: "coreRep@gmail.com",
                        label: "Email",
                        obscureText: false,
                        controller: emailEditController),
                    SizedBox(
                      height: 10,
                    ),
                    TxtField(
                        hint: "Password",
                        label: "Password",
                        obscureText: true,
                        controller: passwordEditController),
                    SizedBox(
                      height: 10,
                    ),
                    TxtField(
                        hint: "Password",
                        label: "Confirm Password",
                        obscureText: true,
                        controller: confirmPasswordEditController),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 25,
                    ),

                    MyButton(text: "Register", onTap: register),
                    SizedBox(
                      height: 25,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account?"),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: Text(
                            " Login Here",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
