//Bullet List
// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';

class MyBullet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15.0,
      width: 15.0,
      decoration: const BoxDecoration(
        color: Colors.orangeAccent,
        shape: BoxShape.rectangle,
      ),
    );
  }
}
