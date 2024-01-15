// ignore_for_file: camel_case_types, non_constant_identifier_names, sized_box_for_whitespace

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness/Homeworkout/Beginner/absbeg.dart';
import 'package:fitness/Homeworkout/Beginner/detailsScreen.dart';
import 'package:fitness/Homeworkout/home_work.dart';
import 'package:fitness/Homeworkout/nextScreen.dart';
import 'package:fitness/Widget/alterDialog.dart';
import 'package:fitness/Widget/play_pauseIcon.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class Exercise_Screen extends StatefulWidget {
  final DocumentSnapshot Exercise;
  const Exercise_Screen({super.key,required this.Exercise});

  @override
  State<Exercise_Screen> createState() => _Exercise_ScreenState();
}

class _Exercise_ScreenState extends State<Exercise_Screen> {

  late Timer timer;
  int total_Time = 30;
  bool isTime = false;

  void StartTime(){
   timer = Timer.periodic(const Duration(seconds: 1), (timer) {
     setState(() {
       if (total_Time > 0) {
         total_Time--;
       } else {
         timer.cancel(); // Cancel the timer
         Navigator.pushReplacement(
           context,
           MaterialPageRoute(builder: (context) =>  Next_Screen(),
           ));
       }
     });
   });
  }

  void PauseTime(){
    StartTime();
  }
  void stopTime(){
    timer.cancel();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog_Screen(
          onResumeScan: () {
            Navigator.of(context).pop(); // Close the dialog.
          },
          ontakelook: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Detail_Screen(Details: widget.Exercise)));
          },
          onQuitScan: () {
           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Home_workout()));
          },
        );
      },
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    StartTime();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer.cancel();
  }

  void StartTimeAction(){
   if(isTime){
     PauseTime();
   }
   else {
     stopTime();

   }
   setState(() {
     isTime =! isTime;
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const abs_beginner()));
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.50,
              width: double.infinity,
              color: Colors.white12,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Lottie.network(
                      widget.Exercise.get('image'),
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
              const SizedBox(height: 10,),
              Flexible(
                child:   Text(widget.Exercise.get('title').toString(),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              ),
              const SizedBox(height: 10),
              RichText(text: TextSpan(
                  text: '',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 27),
                  children:[
                    TextSpan(
                        text: '00:$total_Time',style: const TextStyle(color: Colors.orange)
                    ),
                  ]
              )),
              const SizedBox(height: 30,),
              PlayPauseIcon(
                  size: 40,
                  onTap: (isPlaying) {
                  StartTimeAction();
                },
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: (){},
                      child: const Text('Previous',style: TextStyle(fontSize: 18,color: Colors.white)),
                  ),

                  TextButton(
                    onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Next_Screen()));
                    },
                    child: const Text('Skip',style: TextStyle(fontSize: 18,color: Colors.white)),
                  )
                ],
              ),
            ],
          ),
        ),
          ],
        ),
      )
    );
  }
}
