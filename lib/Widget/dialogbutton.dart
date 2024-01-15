
// ignore_for_file: must_be_immutable, camel_case_types, deprecated_member_use, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Dialog_button extends StatelessWidget {
  final String title;
  final VoidCallback ontap;
  const Dialog_button({
    required this.title,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: Colors.white,
          //backgroundColor: Colors.orange.shade300,
        ),
        onPressed:ontap,
        child: Text(title,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
      );
  }
}