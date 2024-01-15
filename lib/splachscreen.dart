


// ignore_for_file: non_constant_identifier_names
import 'package:fitness/Firebase_Service/islogin.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  Firebase_Service splachService = Firebase_Service();
 // NotificationService notificationService = NotificationService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splachService.isLogin(context);
   // notificationService.NotificationPermission();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height/1.5,
              width: double.infinity,
              child: Center(
              child: Lottie.asset("assets/animationsc.json"),
              )
              ),
          ),
          const Spacer(),
          Center(
           child:  RichText(
             text: const TextSpan(
               text: 'Fit',style: TextStyle(fontSize: 30),
               children: [
                 TextSpan(
                   text: 'me',style: TextStyle(color: Colors.orange),
                 ),
               ]
             ),
           )
          ),
          const Spacer(),
        ],
      )

    );
  }
}
