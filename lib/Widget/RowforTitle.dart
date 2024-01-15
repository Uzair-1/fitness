// ignore_for_file: file_names, camel_case_types

import 'package:flutter/cupertino.dart';

class titleRow extends StatelessWidget {

  final String title1;
  final String title2;

  const titleRow({required this.title1, required this.title2, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              text: title1, style: const TextStyle(fontSize: 16,),
              children: [
                TextSpan(
                  text: title2,style: const TextStyle(color: Color(0xFFFB8C00)),
                )
              ]
            ),
          )
        ],
      ),
    );

  }
}
