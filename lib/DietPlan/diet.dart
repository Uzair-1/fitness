// ignore_for_file: sort_child_properties_last, sized_box_for_whitespace, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:fitness/DietPlan/day1.dart';
import 'package:fitness/DietPlan/day2.dart';
import 'package:fitness/DietPlan/day3.dart';
import 'package:fitness/DietPlan/day4.dart';
import 'package:fitness/DietPlan/day5.dart';
import 'package:fitness/DietPlan/day6.dart';
import 'package:fitness/DietPlan/day7.dart';
import 'package:flutter/material.dart';

class Diet extends StatefulWidget {
  @override
  _DietState createState() => _DietState();
}

class _DietState extends State<Diet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title:RichText(
            text: const TextSpan(
              text: 'Diet',
              style: TextStyle(fontSize: 20, color: Colors.white),
              children: [
                TextSpan(text: 'Plan', style: TextStyle(color: Colors.orange)),
              ],
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 5),
            ),
            Container(
              height: MediaQuery.of(context).size.height/3.8,
              width: double.infinity,
              child: Image.asset('assets/movepicture.png',
                fit: BoxFit.contain,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.0)),
                  child:const Text("Monday",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DayOne()),
                    );
                  },
                  height: 100,
                  minWidth: 100,
                  color: Colors.orange.withOpacity(0.6),
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.0)),
                  child: const Text("Tuesday",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DayTwo()),
                    );
                  },
                  height: 100,
                  minWidth: 100,
                  color: Colors.orange.withOpacity(0.6),
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.0)),
                  child: const Text("Wednsday",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DayThree()),
                    );
                  },
                  height: 100,
                  minWidth: 100,
                  color: Colors.orange.withOpacity(0.6),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.0)),
                  child: const Text("Thursday",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DayFour()),
                    );
                  },
                  height: 100,
                  minWidth: 100,
                  color: Colors.orange.withOpacity(0.6),
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.0)),
                  child: const Text("Friday",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DayFive()),
                    );
                  },
                  height: 100,
                  minWidth: 100,
                  color: Colors.orange.withOpacity(0.6),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.0)),
                  child: const Text("Saturday",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DaySix()),
                    );
                  },
                  height: 100,
                  minWidth: 100,
                  color: Colors.orange.withOpacity(0.6),
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.0)),
                  child: const Text("Sunday", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DaySeven()),
                    );
                  },
                  height: 100,
                  minWidth: 100,
                  color: Colors.orange.withOpacity(0.6),
                ),
              ],
            )
          ],
        ),
      );
    // This trailing comma makes auto-formatting nicer for build methods.
  }
}









