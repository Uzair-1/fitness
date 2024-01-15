// ignore_for_file: camel_case_types

import 'package:fitness/Dashborad.dart';
import 'package:fitness/Homeworkout/Advanced/chestadv.dart';
import 'package:fitness/Homeworkout/Advanced/legadv.dart';
import 'package:fitness/Homeworkout/Advanced/shoulderadv.dart';
import 'package:fitness/Homeworkout/Beginner/leg.dart';
import 'package:fitness/Homeworkout/Interminated/absinter.dart';
import 'package:fitness/Homeworkout/Interminated/armintern.dart';
import 'package:fitness/Homeworkout/Interminated/chestinter.dart';
import 'package:fitness/Homeworkout/Interminated/leginter.dart';
import 'package:fitness/Homeworkout/Interminated/shoulderinter.dart';
import 'package:fitness/Widget/Custom_home_Container.dart';
import 'package:fitness/Widget/RowforTitle.dart';
import 'package:flutter/material.dart';
import 'Advanced/armadv.dart';
import 'Beginner/arm.dart';
import 'Beginner/chest.dart';
import 'Beginner/shoulder.dart';

class Home_workout extends StatefulWidget {
  const Home_workout({super.key});

  @override
  State<Home_workout> createState() => _Home_workoutState();
}

class _Home_workoutState extends State<Home_workout> {
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
            text: 'Home',
            style: TextStyle(fontSize: 20, color: Colors.white),
            children: [
              TextSpan(text: 'Workout', style: TextStyle(color: Colors.orange)),
            ],
          ),
        ),
      ),
      body: Padding(padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const titleRow(title1: '', title2: 'BEGINNER'),
            Customhome_Container(
                title: 'ABS BEGINNER',
                image: 'assets/shoulder.jpg',
                ontapped: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const arm_Beginner()));
                }
            ),
            const Divider(),
            Customhome_Container(
                title: 'CHEST BEGINNER',
                image: "assets/chest.jpg",
                ontapped: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const chest_Beginner()));
                }
            ),
            const Divider(),
            Customhome_Container(
                title: 'ARM BEGINNER',
                image: 'assets/arm.jpg',
                ontapped: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const arm_Beginner()));
                }
            ),
            const Divider(),
            Customhome_Container(
                title: 'LEG BEGINNER',
                image: 'assets/legv.jpg',
                ontapped: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Leg_Beginner()));
                }
            ),
            const Divider(),
            Customhome_Container(
                title: 'SHOULD & BACK\nBEGINNER',
                image: 'assets/abs.jpg',
                ontapped: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const shoulder_Beginner()));
                }
            ),
            const SizedBox(height: 30,),

            // INTERMEDIATE

            const titleRow(title1: '', title2: 'INTERMEDIATE'),
            Customhome_Container(
                title: 'ABS INTERMEDIATE',
                image: 'assets/picture.png',
                ontapped: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const ABS_inter()));
                }
            ),
            const Divider(),
            Customhome_Container(
                title: 'ARM INTERMEDIATE',
                image: 'assets/picture.png',
                ontapped: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const arm_inter()));
                }
            ),
            Customhome_Container(
                title: 'CHEST INTERMEDIATE',
                image: 'assets/picture.png',
                ontapped: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const chest_inter()));
                }
            ),
            const Divider(),
            Customhome_Container(
                title: 'LEG INTERMEDIATE',
                image: 'assets/picture.png',
                ontapped: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Leg_inter()));
                }
            ),
            const Divider(),
            Customhome_Container(
                title: 'SHOULD & BACK\nINTERMEDIATE',
                image: 'assets/picture.png',
                ontapped: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Shoulder_inter()));
                }
            ),
            const SizedBox(height: 30,),

            // ADVANCED

            const titleRow(title1: '', title2: 'ADVANCED'),
            Customhome_Container(
                title: 'ABS ADVANCED',
                image: 'assets/picture.png',
                ontapped: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const arm_Advance()));
                }
            ),
            const Divider(),
            Customhome_Container(
                title: 'CHEST ADVANCED',
                image: 'assets/picture.png',
                ontapped: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const chest_Advance()));
                }
            ),
            Customhome_Container(
                title: 'ARM ADVANCED',
                image: 'assets/picture.png',
                ontapped: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const arm_Advance()));
                }
            ),
            const Divider(),
            Customhome_Container(
                title: 'LEG ADVANCED',
                image: 'assets/picture.png',
                ontapped: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Leg_Advance()));
                }
            ),
            const Divider(),
            Customhome_Container(
                title: 'SHOULD & BACK\nADVANCED',
                image: 'assets/picture.png',
                ontapped: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Shoulder_Advance()));
                }
            ),
          ],
        )
      ),
      ),
    );
  }
}
