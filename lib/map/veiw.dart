// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api, sized_box_for_whitespace, unnecessary_string_escapes, unused_import

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'map.dart';

class Reg extends StatefulWidget {
  @override
  _RegState createState() => _RegState();
}

class _RegState extends State<Reg> {
  TextEditingController C = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sing up"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 8,
            ),
            TextField(
              style: TextStyle(fontSize: 16),
              decoration: InputDecoration(
                labelText: 'Email',
                focusColor: Colors.black,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            TextField(
              style: TextStyle(fontSize: 16),
              decoration: InputDecoration(
                labelText: 'Name',
                focusColor: Colors.black,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            TextField(
              controller: C,
              style: TextStyle(fontSize: 16),
              decoration: InputDecoration(
                labelText: 'Phone Number',
                focusColor: Colors.black,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    //color: Colors.blue,
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    onPressed: () {
                      if (C.text.length >= 10) {
                        Fluttertoast.showToast(
                            msg: "Thank You We\'ll Contact You Soon",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            textColor: Colors.white,
                            fontSize: 16.0);

                        Navigator.of(context).pop();
                      } else {
                        Fluttertoast.showToast(
                            msg: "Enter All The Details",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    }))
          ],
        ),
      ),
    );
  }
}
