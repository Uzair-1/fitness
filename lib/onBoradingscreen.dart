
// ignore_for_file: file_names, sized_box_for_whitespace, sort_child_properties_last, deprecated_member_use, non_constant_identifier_names

import 'package:fitness/Create_Screen.dart';
import 'package:fitness/login.dart';
import 'package:fitness/signup.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoradingScreen extends StatefulWidget {
  const OnBoradingScreen({super.key});

  @override
  State<OnBoradingScreen> createState() => _OnBoradingScreenState();
}

class _OnBoradingScreenState extends State<OnBoradingScreen> {
  bool loading = false;
  final Controller = PageController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // elevation: 0,
        actions: [
          const Text('Skip'),
          IconButton(icon: const Icon(Icons.arrow_forward_ios),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const createScreen()));
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(padding: const EdgeInsets.all(10),
        child: PageView(
                controller: Controller,
                children: [
                SingleChildScrollView(
                  child:  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height/3.5,
                        width: double.infinity,
                        child: Lottie.asset("assets/animation_llkx8ye5.json"),
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: const TextSpan(
                                text: 'Body',style: TextStyle(fontSize: 30),
                                children: [
                                  TextSpan(
                                    text: 'Building',style: TextStyle(color: Colors.orange),
                                  ),
                                ]
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 2,),
                      const Wrap(
                        children: [
                          Text('Bodybuilding, a regimen of exercises designed to enhance the human bodys muscular development and promote general health and fitness.'),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height/10,),
                      Container(
                        height: 50,
                        width: double.infinity,
                        child: Center(
                          child:
                          Flexible(
                            child:
                            SmoothPageIndicator(
                              controller:Controller,
                              count:3,
                              effect:const JumpingDotEffect(),
                            ),
                          )
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height/7.6,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        OutlinedButton(
                          child: const Text('LOG IN'),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                            primary: Colors.black
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
                          },
                        ),
                        OutlinedButton(
                          child: const Text('SIGN UP'),
                          style: OutlinedButton.styleFrom(
                          ),
                          onPressed: () { Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const signUpScreen()));},
                        ),
                      ],
                    ),
                    ],
                  ),
                ),
                  SingleChildScrollView(
                    child:  Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height/3.5,
                          width: double.infinity,
                          child: Lottie.asset("assets/animation_llkzp441.json"),
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: const TextSpan(
                                  text: 'Body',style: TextStyle(fontSize: 30),
                                  children: [
                                    TextSpan(
                                      text: 'Exercise',style: TextStyle(color: Colors.orange),
                                    ),
                                  ]
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 2,),
                        const Wrap(
                          children: [
                            Text('Anaerobic exercise also includes weight training,functional training,and high-intensity interval training which increase short term muscle strength'),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height/10,),
                        Container(
                          height: 50,
                          width: double.infinity,
                          child: Center(
                              child:
                              Flexible(
                                child:
                                SmoothPageIndicator(
                                  controller:Controller,
                                  count:3,
                                  effect:const JumpingDotEffect(),
                                ),
                              )
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height/7.6,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            OutlinedButton(
                              child: const Text('LOG IN'),
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  primary: Colors.black
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
                              },
                            ),
                            OutlinedButton(
                              child: const Text('SIGN UP'),
                              style: OutlinedButton.styleFrom(
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const signUpScreen()));
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child:  Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height/3.5,
                          width: double.infinity,
                          child: Lottie.asset("assets/animation_lll6f7z4.json"),
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: const TextSpan(
                                  text: 'Body',style: TextStyle(fontSize: 30),
                                  children: [
                                    TextSpan(
                                      text: 'Dieting',style: TextStyle(color: Colors.orange),
                                    ),
                                  ]
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 2,),
                        const Wrap(
                          children: [
                            Text("Dieting typically refers to individuals' attempts to lose weight by restricting the amount or types of foods that are consumed."),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height/10,),
                        Container(
                          height: 50,
                          width: double.infinity,
                          child: Center(
                              child:
                              Flexible(
                                child:
                                SmoothPageIndicator(
                                  controller:Controller,
                                  count:3,
                                  effect:const JumpingDotEffect(),
                                ),
                              )
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height/7.6,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            OutlinedButton(
                              child: const Text('LOG IN'),
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  primary: Colors.black
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
                              },
                            ),
                            OutlinedButton(
                              child: const Text('SIGN UP'),
                              style: OutlinedButton.styleFrom(
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const signUpScreen()));
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

        ),
      ),
    );
  }
}
