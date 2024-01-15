// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, camel_case_types

import 'package:fitness/Widget/icon.dart';
import 'package:flutter/material.dart';

class Customhome_Container extends StatelessWidget {
  final VoidCallback ontapped;
  final String title;
  final String image;

  const Customhome_Container({required this.title, required this.image,required this.ontapped});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontapped,
      borderRadius: BorderRadius.circular(10),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 140,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(image),
            ),
          ),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Row(
                children: [
                  Text(title,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ],
              ),
             Spacer(),
             Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 IconRow(iconColor: Colors.blue.shade200,),
                 IconRow(iconColor: Colors.white,),
                 IconRow(iconColor: Colors.white,),
               ],
             ),

            ]
          )
      ),
    );
  }
}
