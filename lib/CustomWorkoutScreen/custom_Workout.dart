// ignore_for_file: camel_case_types, unused_import

import 'package:fitness/CustomWorkoutScreen/Advanced/abs.dart';
import 'package:fitness/CustomWorkoutScreen/Advanced/arm.dart';
import 'package:fitness/CustomWorkoutScreen/Advanced/chest.dart';
import 'package:fitness/CustomWorkoutScreen/Advanced/shoulder.dart';
import 'package:fitness/CustomWorkoutScreen/Beginner/arm.dart';
import 'package:fitness/CustomWorkoutScreen/Beginner/shoulder.dart';
import 'package:fitness/CustomWorkoutScreen/Intermediate/abs.dart';
import 'package:fitness/CustomWorkoutScreen/Intermediate/arm.dart';
import 'package:fitness/CustomWorkoutScreen/Intermediate/shoulder.dart';
import 'package:fitness/Dashborad.dart';
import 'package:fitness/Homeworkout/Advanced/chestadv.dart';
import 'package:fitness/Homeworkout/Advanced/legadv.dart';
import 'package:fitness/Homeworkout/Advanced/shoulderadv.dart';
import 'package:fitness/Homeworkout/Interminated/absinter.dart';
import 'package:fitness/Homeworkout/Interminated/armintern.dart';
import 'package:fitness/Homeworkout/Interminated/chestinter.dart';
import 'package:fitness/Homeworkout/Interminated/leginter.dart';
import 'package:fitness/Homeworkout/Interminated/shoulderinter.dart';
import 'package:fitness/Widget/Custom_home_Container.dart';
import 'package:fitness/Widget/RowforTitle.dart';
import 'package:flutter/material.dart';

import 'Beginner/chest.dart';
import 'Beginner/leg.dart';
import 'Intermediate/chest.dart';
import 'Intermediate/leg.dart';

class Customworkout extends StatefulWidget {
  const Customworkout({super.key});

  @override
  State<Customworkout> createState() => _CustomworkoutState();
}

class _CustomworkoutState extends State<Customworkout> {
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
            text: 'Custom',
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
                // Customhome_Container(
                //     title: 'ABS BEGINNER',
                //     image: 'assets/picture.png',
                //     ontapped: () {
                //       // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const ABS_Beginner()));
                //     }
                // ),
                const Divider(),
                Customhome_Container(
                    title: 'CHEST BEGINNER',
                    image: "assets/chest.jpg",
                    ontapped: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>const chest()));
                    }
                ),
                const Divider(),
                Customhome_Container(
                    title: 'ARM BEGINNER',
                    image: 'assets/arm.jpg',
                    ontapped: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const arm()));
                    }
                ),
                const Divider(),
                Customhome_Container(
                    title: 'LEG BEGINNER',
                    image: 'assets/legv.jpg',
                    ontapped: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const Leg()));
                    }
                ),
                const Divider(),
                Customhome_Container(
                    title: 'SHOULD & BACK\nBEGINNER',
                    image: 'assets/abs.jpg',
                    ontapped: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const shoulder()));
                    }
                ),
                const SizedBox(height: 30,),

                // INTERMEDIATE

                const titleRow(title1: '', title2: 'INTERMEDIATE'),
                Customhome_Container(
                    title: 'ABS INTERMEDIATE',
                    image: 'assets/shoulder.jpg',
                    ontapped: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const ABS_intercus()));
                    }
                ),
                const Divider(),
                Customhome_Container(
                    title: 'ARM INTERMEDIATE',
                    image: 'assets/picture.png',
                    ontapped: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const arm_intercus()));
                    }
                ),
                Customhome_Container(
                    title: 'CHEST INTERMEDIATE',
                    image: 'assets/picture.png',
                    ontapped: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const chest_intercus()));
                    }
                ),
                const Divider(),
                Customhome_Container(
                    title: 'LEG INTERMEDIATE',
                    image: 'assets/picture.png',
                    ontapped: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Leg_intercus()));
                    }
                ),
                const Divider(),
                Customhome_Container(
                    title: 'SHOULD & BACK\nINTERMEDIATE',
                    image: 'assets/picture.png',
                    ontapped: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Shoulder_intercus()));
                    }
                ),
                const SizedBox(height: 30,),

                // ADVANCED

                const titleRow(title1: '', title2: 'ADVANCED'),
                Customhome_Container(
                    title: 'ABS ADVANCED',
                    image: 'assets/picture.png',
                    ontapped: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const ABSadv_Cus()));
                    }
                ),
                const Divider(),
                Customhome_Container(
                    title: 'CHEST ADVANCED',
                    image: 'assets/picture.png',
                    ontapped: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const chestadv_Cus()));
                    }
                ),
                Customhome_Container(
                    title: 'ARM ADVANCED',
                    image: 'assets/picture.png',
                    ontapped: () {
                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const armadv_Cus()));
                    }
                ),
                const Divider(),
                Customhome_Container(
                    title: 'LEG ADVANCED',
                    image: 'assets/picture.png',
                    ontapped: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Leg_intercus()));
                    }
                ),
                const Divider(),
                Customhome_Container(
                    title: 'SHOULD & BACK\nADVANCED',
                    image: 'assets/picture.png',
                    ontapped: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Shoulderadv_Cus()));
                    }
                ),
              ],
            )
        ),
      ),
    );
  }
}
