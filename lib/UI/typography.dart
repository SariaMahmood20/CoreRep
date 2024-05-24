import 'package:flutter/material.dart';

class Typography extends StatelessWidget {
  const Typography(this.content, {key});
  final content;
  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(fontSize: 16, color: Colors.white),
    );
  }
}
