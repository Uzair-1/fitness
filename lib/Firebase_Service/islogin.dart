// ignore_for_file: camel_case_types

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/Dashborad.dart';
import 'package:fitness/movescreen.dart';
import 'package:flutter/material.dart';

class Firebase_Service {
  final auth = FirebaseAuth.instance;

  void isLogin (BuildContext context){
   if(auth.currentUser!=null){
    Future.delayed(const Duration(seconds: 5),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Dashborad_Screen()));
    });
   } else {
    Future.delayed(const Duration(seconds: 5),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Move_Screen()));
    });
   }


  }
}