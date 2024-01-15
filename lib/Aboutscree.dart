// ignore_for_file: file_names, camel_case_types, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class About_Screen extends StatelessWidget {
  const About_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
                'DEVELOPER BY \n UNIVERSITY OF LAHORE',
              style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
            )
          ],
        ),
      )

    );
  }
}
