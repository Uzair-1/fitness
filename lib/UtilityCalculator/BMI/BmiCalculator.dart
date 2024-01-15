

// ignore_for_file: camel_case_types, file_names, non_constant_identifier_names, avoid_unnecessary_containers, prefer_typing_uninitialized_variables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Bmi_Cal extends StatefulWidget {
  const Bmi_Cal({super.key});

  @override
  State<Bmi_Cal> createState() => _Bmi_CalState();
}

class _Bmi_CalState extends State<Bmi_Cal> {

  var weightController =  TextEditingController();
  var FeetController =  TextEditingController();
  var InchController = TextEditingController();
  var result = "";
  var bmi ;
  var def_Colour;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        backgroundColor: def_Colour,
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
                      height: MediaQuery.of(context).size.height/4.2,
                      width: double.infinity,
                      child: Lottie.asset("assets/animation_llkx8ye5.json"),
                    ),
                    const SizedBox(height: 40),
                    TextFormField(
                      controller: weightController,
                      cursorColor: Colors.orange,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Enter the Weight (Kg)', labelStyle: const TextStyle(color: Colors.white),
                          prefixIcon: Icon(Icons.line_weight_outlined,color: Colors.orange.withOpacity(0.6)),
                          border: const OutlineInputBorder()
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: FeetController,
                      cursorColor: Colors.orange,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Enter the Height (Feet)',
                        labelStyle: const TextStyle(color: Colors.white),
                        prefixIcon: Icon(Icons.height_outlined,color: Colors.orange.withOpacity(0.6)),
                        border: const OutlineInputBorder(),
                      ),
                    ), const SizedBox(height: 20),
                    TextFormField(
                      controller: InchController,
                      cursorColor: Colors.orange,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Enter the Height (Inch)', labelStyle: const TextStyle(color: Colors.white),
                          prefixIcon: Icon(Icons.height_outlined,color: Colors.orange.withOpacity(0.6)),
                          border: const OutlineInputBorder()
                      ),
                    ), const SizedBox(height: 20),
                    const SizedBox(height: 10),
                    Text(result,style: const TextStyle(fontSize: 20)),
                    const SizedBox(height: 40),
                    Container(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 3, //elevation of button
                            shape: RoundedRectangleBorder( //to set border radius to button
                              borderRadius: BorderRadius.circular(28),
                            ),
                            backgroundColor: Colors.orange.shade500,
                            padding: const EdgeInsets.all(20) //content padding inside button
                        ),
                        onPressed:(){
                          var wt = weightController.text.toString();
                          var ft = FeetController.text.toString();
                          var inch = InchController.text.toString();

                          if(wt!= "" && ft!= "" && inch!= ""){
                            // first we convert all the decimal values in int
                            var tot_weight = int.parse(wt);
                            var ift = int.parse(ft);
                            var inches = int.parse(inch);
                            // second we convert the inches into cm & then cm  into meter
                            var tot_inch =  (ift * 12)/ inches;
                            var tot_cm = tot_inch * 2.54;
                            var tot_meter = tot_cm/100;
                            // Here we Calculate the BMI
                            bmi = tot_weight/(tot_meter*tot_meter);
                            var show_msg ;
                            if(bmi>25){
                              show_msg = "You're Over Weight";
                              def_Colour = Colors.red.withOpacity(0.4);
                            } else if (bmi<18){
                              show_msg = "You're Under Weight";
                              def_Colour = Colors.lightGreen.withOpacity(0.4);
                            } else {
                              show_msg = "You're Healthy ";
                              def_Colour = Colors.green.withOpacity(0.4);
                            }

                            setState(() {
                              result = " $show_msg \n Your BMI is : $bmi";
                            });
                          } else{
                            setState(() {
                              result = "Fill the required field first";
                            });
                          }
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.favorite,color: Colors.red),
                            SizedBox(width: 10),
                            Text('Calculate BMI',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
            )
        ),
      )
    );
  }
}
