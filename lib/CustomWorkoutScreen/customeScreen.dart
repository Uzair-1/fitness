// ignore_for_file: camel_case_types, file_names

import 'package:fitness/CustomWorkoutScreen/Dodo/Models/home_Screen.dart';
import 'package:fitness/Dashborad.dart';
import 'package:flutter/material.dart';
import '../Widget/CustomImage_Container.dart';

class Custom_WorkoutScreen extends StatefulWidget {
  const Custom_WorkoutScreen({super.key});

  @override
  State<Custom_WorkoutScreen> createState() => _Custom_WorkoutScreenState();
}

class _Custom_WorkoutScreenState extends State<Custom_WorkoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
            onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Dashborad_Screen()));
            },
            icon: const Icon(Icons.arrow_back)),
        title:RichText(
          text: const TextSpan(
            text: 'Custom Workout',
            style: TextStyle(fontSize: 20, color: Colors.white),
            children: [
              TextSpan(text: 'Notes', style: TextStyle(color: Colors.orange)),
            ],
          ),
        ),
      ),
      body:  Padding(padding: const EdgeInsets.all(20),
       child: SingleChildScrollView(
       child: Column(
       children: [
         const Divider(height: 30),
         CustomImageContainer(
           title: 'Gym & Home \nWorkout Notes',
           image: "assets/picture.png",
           ontapped: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const toDo_HomeScreen()));
           },
         ),
        ],
       ),
      ),
     ),
    );
  }
}
