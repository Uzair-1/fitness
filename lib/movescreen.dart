

// ignore_for_file: camel_case_types, sized_box_for_whitespace

import 'package:fitness/utils/button.dart';
import 'package:flutter/material.dart';

import 'onBoradingscreen.dart';

class Move_Screen extends StatefulWidget {
  const Move_Screen({super.key});

  @override
  State<Move_Screen> createState() => _Move_ScreenState();
}

class _Move_ScreenState extends State<Move_Screen> {
  bool loading =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Fitme',style: TextStyle(fontSize: 25),),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(padding: const EdgeInsets.all(10),
          child: SingleChildScrollView( 
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height/2.2,
                  width: double.infinity,
                  child: Image.asset('assets/movepicture.png',
                  fit: BoxFit.contain,
                  ),
                ),
                RichText(
                  text: const TextSpan(
                      text: "Let's",style: TextStyle(fontSize: 30,),
                      children: [
                        TextSpan(
                            text: 'Move',style: TextStyle(color: Colors.orange)
                        ),
                      ]
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height/20,),
                const Text('Fitness and wellness for\nyou anytime, anywhere'),
                SizedBox(height: MediaQuery.of(context).size.height/7.9,),
                Custom_Button(title: 'GET STARTED', ontap: () {
                      setState(() {
                        loading=true;
                      });
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const OnBoradingScreen()));
                    }, loading: loading,),
              ],
            ),
          ),


          ),
        ),
    );
  }
}

