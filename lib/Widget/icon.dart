// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconRow extends StatelessWidget {
  final Color iconColor;
  const IconRow({required this.iconColor, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
         Icon(Icons.accessibility_new_sharp,size: 12,color: iconColor,),
        ],
      ),
    );

  }
}
