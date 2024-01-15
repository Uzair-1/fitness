// ignore_for_file: camel_case_types, file_names, sized_box_for_whitespace

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/Aboutscree.dart';
import 'package:fitness/Widget/RowforTitle.dart';
import 'package:fitness/Homeworkout/home_work.dart';
import 'package:fitness/CustomWorkoutScreen/customeScreen.dart';
import 'package:fitness/movescreen.dart';
import 'package:fitness/utils/error_handle.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'ChatBot/chatScreen.dart';
import 'CustomWorkoutScreen/custom_Workout.dart';
import 'FitnessVedio/youtubeVedio.dart';
import 'UtilityCalculator/utilityCalculator.dart';
import 'Widget/CustomImage_Container.dart';
import 'DietPlan/diet.dart';
import 'map/Pedometer.dart';

class Dashborad_Screen extends StatefulWidget {
  const Dashborad_Screen({super.key});

  @override
  State<Dashborad_Screen> createState() => _Dashborad_ScreenState();
}

class _Dashborad_ScreenState extends State<Dashborad_Screen> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title:RichText(
        text: const TextSpan(
        text: 'Fit',
        style: TextStyle(fontSize: 20, color: Colors.white),
         children: [
        TextSpan(text: 'me', style: TextStyle(color: Colors.orange)),
         ],
         ),
       ),
     ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
             DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.orange,
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  child:
                  Lottie.asset("assets/animation_llkzp441.json",height: 200),
                ),
                decoration: const BoxDecoration(color: Colors.orangeAccent),
                accountName: const Text(
                  ""),
               accountEmail: Text(FirebaseAuth.instance.currentUser!.email.toString()),
              ),
            ), //DrawerHeader
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' My Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.workspace_premium),
              title: const Text(' Go Premium '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: (){
                auth.signOut().then((value) {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Move_Screen()));
                }).onError((error, stackTrace) {
                  ErrorHandle().showError(error.toString());
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.play_circle_fill_sharp),
              title: const Text(' Fitness Videos'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const YoutubeVedio()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text(' About App '),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const About_Screen()));
              },
            ),
          ],
        ),
      ), //Drawer
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(bottom: 20),
        child:  SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
               InkWell(
                 onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>const ChatPage()));
                 },
                 borderRadius: BorderRadius.circular(25),
                 child:  SizedBox(
                   height: 150,
                   width: double.infinity,
                   child: Container(
                     padding: const EdgeInsets.only(right: 10, left: 10),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(25),
                       color: Colors.yellowAccent,
                       boxShadow: [
                         BoxShadow(
                           color: Colors.orangeAccent.shade200,
                           offset: const Offset(2.0, 2.0),
                           blurRadius: 5.2,
                           spreadRadius: 5.0,
                         ),
                       ],
                     ),
                     child: SingleChildScrollView(
                       scrollDirection: Axis.horizontal, // Allow horizontal scrolling
                       child:Row(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: [
                             const Text('Chat Bot\nAI\nfor workout',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)
                             ),
                             const SizedBox(width: 40),
                             Image.asset('assets/dashpicture.png'),
                           ]
                       )
                     ),
                   ),
                 ),
               ),

                const Divider(height: 30,),
                const titleRow(title1: 'Custom', title2: 'Workout'),
                CustomImageContainer(
                  title: 'Custom Workout',
                  image: "assets/leg.jpg",
                  ontapped: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>const Customworkout()));
                  },
                ),
                const Divider(height: 20,),
                const titleRow(title1: 'Home', title2: 'Workout'),
                 CustomImageContainer(
                  title: 'Home Workout',
                  image: "assets/work.jpg",
                  ontapped: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const Home_workout()));
                  },
                ),
                const Divider(height: 20,),
                const titleRow(title1: 'Gym', title2: 'Workout'),
                 CustomImageContainer(
                  title: 'Gym Workout',
                   image: "assets/gymff.jpg",
                   ontapped: () {
                   // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SplachScreen()));
                   },
                ),
                const Divider(height: 20,),
                 CustomImageContainer(
                  title: 'BodyBuilding',
                   image: "assets/customwork.jpg",
                   ontapped: () {
                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SplachScreen()));
                   },
                ),
                // const Divider(),
                //  CustomImageContainer(
                //   title: 'Training',
                //   image: "assets/picture.png",
                //   ontapped: () {
                //    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SplachScreen()));
                //   },
                // ),
                // const Divider(),
                //  CustomImageContainer(
                //   title: 'Exercise',
                //   image: "assets/picture.png",
                //   ontapped: () {
                //     //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SplachScreen()));
                //   },
                // ),
                const Divider(),
              ],
            ),
          ),
        ),
      ),
        bottomSheet: Container(
          // padding: const EdgeInsets.symmetric(horizontal: 40),
          height: 60,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: (){}, icon: const Icon(Icons.home_filled)),
                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PedometerChart()));
                }, icon: const Icon(Icons.directions_run)),
                FloatingActionButton(onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>const Custom_WorkoutScreen()));
                },backgroundColor: Colors.orange,shape: const CircleBorder(),child: const Icon(Icons.add,color: Colors.black,),),
                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Diet()));
                }, icon: const Icon(Icons.list_alt)),
                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const utitit_calculator()));
                }, icon: const Icon(Icons.more_horiz)),
              ],
            ),
          )
        ),
      // extendBody: true,
    );
  }
}
