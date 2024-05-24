import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Registration/warning.dart';
import '../UI/txtField.dart';
import '../UI/Buttons.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  void Function()? onTap;
  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailEditController = TextEditingController();

  TextEditingController passwordEditController = TextEditingController();

  void Login() async {
    //show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    //

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailEditController.text,
          password: passwordEditController.text);

      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayMessage(e.code, context);
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
                child: Container(

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
                          hint: "corerep@gmail.com",
                          label: "Username or Email",
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text(
                            "Forgot Password?",
                            style: TextStyle(color: Color(0xff6B645D)),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      MyButton(text: "Login", onTap: Login),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account?"),
                          GestureDetector(
                            onTap: widget.onTap,
                            child: const Text(
                              " Register Here",
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
      ),
    );
  }
}
