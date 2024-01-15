// ignore_for_file: camel_case_types, non_constant_identifier_names, sized_box_for_whitespace, file_names, unused_import

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness/CustomWorkoutScreen/exercise.dart';
import 'package:fitness/Homeworkout/Beginner/absbeg.dart';
import 'package:fitness/Homeworkout/Beginner/exercisescreen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Detail_Screencustom extends StatefulWidget {
  final DocumentSnapshot Details;
  const Detail_Screencustom({super.key,required this.Details});

  @override
  State<Detail_Screencustom> createState() => _Detail_ScreencustomState();
}

class _Detail_ScreencustomState extends State<Detail_Screencustom> {

  late Timer _timer;
  int remainTime = 10;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (remainTime > 0) {
          remainTime--;
        } else {
          _timer.cancel(); // Cancel the timer
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) =>  Exercise_Screen(Exercise:widget.Details)),
          );
        }
      });
    });
  }
  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the screen is disposed
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.60,
              width: double.infinity,
              color: Colors.white12,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Lottie.network(
                      widget.Details.get('image'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  RichText(text: const TextSpan(
                      text: '',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 27),
                      children:[
                        TextSpan(
                            text: 'READY TO GO!',style: TextStyle(color: Colors.orange)
                        ),
                      ]
                  )),
                  const SizedBox(height: 40,),
                  Flexible(
                    child:Text(widget.Details.get('title').toString(),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  ),
                  const SizedBox(height: 50,),
                  CircularPercentIndicator(
                    radius: 40,
                    lineWidth: 6,
                    percent: remainTime/10,
                    backgroundColor: Colors.white,
                    progressColor: Colors.orangeAccent,
                    circularStrokeCap: CircularStrokeCap.round,
                    center: Text(
                      remainTime > 0 ? '$remainTime' : 'Go!',
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: (){
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) =>  Exercise_Screencustom(Exercise:widget.Details)),
                            );
                          },
                          icon: const Icon(Icons.arrow_forward_ios)
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
