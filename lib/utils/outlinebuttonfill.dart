
// ignore_for_file: must_be_immutable, camel_case_types, deprecated_member_use, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class outLinebutton extends StatelessWidget {
  final String title;
  final VoidCallback ontap;
  bool loading;
  outLinebutton({
    required this.title,
    required this.ontap,
    required this.loading,
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
      width:250,
      margin: const EdgeInsets.all(4.0),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.orange.shade600,
        ),
        onPressed:ontap,
        child: loading ? const CircularProgressIndicator(color: Colors.white,)
            : Text(title,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
      ),
    );
  }
}