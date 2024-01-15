// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';

  class CustomImageContainer extends StatelessWidget {
  final VoidCallback ontapped;
  final String title;
  final String image;

  const CustomImageContainer({required this.title, required this.image,required this.ontapped});

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
              Row(
                children: [
                  Text(title,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                ],
              ),
            ],
          )
      ),
    );
  }
}
