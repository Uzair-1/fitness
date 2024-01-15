// ignore_for_file: camel_case_types, file_names, sized_box_for_whitespace

import 'package:fitness/UtilityCalculator/BMI/BmiCalculator.dart';
import 'package:fitness/UtilityCalculator/CALORIES/Calories_Cal.dart';
import 'package:fitness/UtilityCalculator/PROTEIN/ProteinCal.dart';
import 'package:flutter/material.dart';

class utitit_calculator extends StatefulWidget {
  const utitit_calculator({super.key});

  @override
  State<utitit_calculator> createState() => _utitit_calculatorState();
}

class _utitit_calculatorState extends State<utitit_calculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool isScolled){
            return [
              SliverAppBar(
                elevation: 0,
                expandedHeight: 150,
                floating: true,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: const Text('Utility'),
                  background: Image.asset("assets/picture.png",fit: BoxFit.cover),
                ),
              )
            ];
          },
          body:  SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               SizedBox(
                 height: MediaQuery.sizeOf(context).height/6,
                 width: double.infinity,
                 child:  Card(
                   child: Center(
                     child: ListTile(
                       leading:  Container(
                         height: 100,
                         width: 100,
                         child: Image.asset('assets/bmipic.png',
                           fit: BoxFit.contain,
                         ),
                       ),
                       title: const Text('BMI Calculator'),
                       onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>const Bmi_Cal()));
                       },
                     ),
                   ),
                 ),
               ),
                const Divider(),const SizedBox(height: 10),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height/6,
                  width: double.infinity,
                  child: Card(
                    child: Center(
                      child: ListTile(
                        leading:  Container(
                          height: 100,
                          width: 100,
                          child: Image.asset('assets/proteinpic.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        title: const Text('Protein Calculator'),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const Protein_Cal()));
                        },
                      ),
                    ),
                  ),
                ),
               const Divider(), const SizedBox(height: 10),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height/6,
                  width: double.infinity,
                  child:Card(
                    child: Center(
                      child: ListTile(
                        leading:  Container(
                          height: 100,
                          width: 100,
                          child: Image.asset('assets/Caloriespic.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        title: const Text('Calories Calculator'),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const Calories_Cal()));
                        },
                      ),
                    ),
                  ),
                ),
                const Divider(),const SizedBox(height: 10),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height/6,
                  width: double.infinity,
                  child: Card(
                    child: Center(
                      child: ListTile(
                        leading:  Container(
                          height: 100,
                          width: 100,
                          child: Image.asset('assets/dashpicture.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        title: const Text('Fat Calculator'),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const Protein_Cal()));
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          )
      )
    );
  }
}
