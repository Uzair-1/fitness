// ignore_for_file: camel_case_types, non_constant_identifier_names, file_names, sized_box_for_whitespace

import 'dart:async';
import 'package:fitness/CustomWorkoutScreen/custom_Workout.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Next_Screencustom extends StatefulWidget {
  const Next_Screencustom({Key? key}) : super(key: key);

  @override
  State<Next_Screencustom> createState() => _Next_ScreencustomState();
}

class _Next_ScreencustomState extends State<Next_Screencustom> {
  bool loading = false;
  int _counter = 20;
  late Timer _timer;
  bool bottomSheetShown = false; // To track if the bottom sheet has been shown

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          _timer.cancel(); // Cancel the timer
          navigateToHomeWorkout();
        }
      });
    });
  }

  // Function to show the bottom sheet
  void showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ListTile(
                // title: Text(widget.Details.get('title')),
                //trailing: Text(widget.Details.get('subtitle'),style: const TextStyle(fontSize: 16),),
              ),
              //Lottie.network(
              // widget.Details.get('image'),
              //fit: BoxFit.contain,
              //height: 200,
              //),
            ],
          ),
        );
      },
    );
  }

  // Function to show the bottom sheet only once
  void showBottomSheetIfNeeded() {
    if (!bottomSheetShown) {
      showBottomSheet();
      bottomSheetShown = true;
    }
  }

  // Function to navigate to Home_workout screen
  void navigateToHomeWorkout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Customworkout()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.withOpacity(0.7),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height / 8),
                const Text('REST',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                CircularPercentIndicator(
                  radius: 50,
                  lineWidth: 6,
                  percent: (_counter / 20).clamp(0.0, 1.0),
                  backgroundColor: Colors.white,
                  progressColor: Colors.orangeAccent,
                  circularStrokeCap: CircularStrokeCap.round,
                  center: Text(
                    _counter > 0 ? '00:$_counter' : '00',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.withOpacity(0.2),
                      ),
                      onPressed: () {
                        setState(() {
                          _timer.cancel();
                          _counter = 20 + _counter;
                          _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
                            setState(() {
                              if (_counter > 0) {
                                _counter--;
                              } else {
                                _timer.cancel();
                              }
                            });
                          });
                        });
                      },
                      child: const Text('+20sec',
                          style: TextStyle(color: Colors.white)),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          _timer.cancel();
                          navigateToHomeWorkout();
                        });
                      },
                      child: const Text(' Skip  ',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
