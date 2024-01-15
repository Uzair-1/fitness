// ignore_for_file: sized_box_for_whitespace, camel_case_types, prefer_typing_uninitialized_variables, non_constant_identifier_names, file_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Protein_Cal extends StatefulWidget {
  const Protein_Cal({super.key});

  @override
  State<Protein_Cal> createState() => _Protein_CalState();
}

class _Protein_CalState extends State<Protein_Cal> {
  var weightController = TextEditingController();
  var result = "";
  var proteinIntake;
  var def_Colour;
  int _selectedMultiplier = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PROTEIN Calculator'),
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
                const SizedBox(height: 20),
                const Row(mainAxisAlignment: MainAxisAlignment.start, children: [Text("Select The One"),],),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Radio(
                      value: 1,
                      groupValue: _selectedMultiplier,
                      onChanged: (value) {
                        setState(() {
                          _selectedMultiplier = value!;
                        });
                      },
                    ),
                    const Text("Not Exercise 1.2"),
                    Radio(
                      value: 2,
                      groupValue: _selectedMultiplier,
                      onChanged: (value) {
                        setState(() {
                          _selectedMultiplier = value!;
                        });
                      },
                    ),
                    const Text("Normal Exercise1.4"),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Radio(
                      value: 3,
                      groupValue: _selectedMultiplier,
                      onChanged: (value) {
                        setState(() {
                          _selectedMultiplier = value!;
                        });
                      },
                    ),
                    const Text("Active Exercise 1.6"),
                  ],
                ),
                const SizedBox(height: 40),
                const SizedBox(height: 10),
                Text(
                  result,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 30),
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
                      if (weightController.text.isNotEmpty) {
                        // Parse weight from TextField
                        var weightInPounds = int.parse(weightController.text.toString());

                        // Convert weight to kilograms
                        var weightInKg = weightInPounds / 2.2;

                        // Calculate protein intake
                        proteinIntake = weightInKg * _selectedMultiplier;

                        setState(() {
                          result =
                          "Your Protein Intake is : $proteinIntake grams";
                        });
                      } else {
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
                          'Calculate Protein ',
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
