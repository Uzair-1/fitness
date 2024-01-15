// ignore_for_file: camel_case_types, unused_local_variable, file_names, non_constant_identifier_names, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Calories_Cal extends StatefulWidget {
  const Calories_Cal({super.key});

  @override
  State<Calories_Cal> createState() => _Calories_CalState();
}

class _Calories_CalState extends State<Calories_Cal> {
  var weightController = TextEditingController();
  var result = "";
  // var proteinIntake;
  var def_Colour;
  // int _selectedMultiplier = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calories Calculator'),
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        color: def_Colour,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Container(
            width: 300,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 4.2,
                  width: double.infinity,
                  child: Lottie.asset("assets/animation_llkx8ye5.json"),
                ),
                const SizedBox(height: 40),
                TextFormField(
                  controller: weightController,
                  cursorColor: Colors.orange,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter the Weight (LBS)',
                    labelStyle: const TextStyle(color: Colors.white),
                    prefixIcon: Icon(Icons.line_weight_outlined,
                        color: Colors.orange.withOpacity(0.6)),
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 50),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height/5,
                  width: double.infinity,
                  child: Card(
                    shadowColor: Colors.yellow,
                    color: Colors.orange.withOpacity(0.6),
                    child: Center(
                     child: Text(
                       result,
                       style: const TextStyle(fontSize: 20),
                     ),
                    )
                  ),
                ),
                const SizedBox(height: 60),
                Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                        backgroundColor: Colors.orange.shade500,
                        padding: const EdgeInsets.all(20)),
                    onPressed: () {
                       if(weightController.text.isNotEmpty){
                         var weightPound = int.parse(weightController.text.toString());
                         // convert the weight Pound into kg
                         var weightKg = weightPound / 2.2;
                         // calculate the total Calories here
                         var totalCalories = weightKg * 12;
                         setState(() {
                           result = "Calories Required \n $totalCalories";
                         });

                       }else {
                        setState(() {
                          result = "Fill the required field first";
                        });
                       }
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.favorite, color: Colors.red),
                        SizedBox(width: 10),
                        Text(
                          'Calculate Calories',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
