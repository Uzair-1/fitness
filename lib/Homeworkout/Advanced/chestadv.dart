// ignore_for_file: camel_case_types, avoid_unnecessary_containers, sized_box_for_whitespace


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness/Homeworkout/Beginner/detailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:fitness/Homeworkout/home_work.dart';
import 'package:lottie/lottie.dart';

import '../../Widget/RowTitlework.dart';

class chest_Advance extends StatefulWidget {
  const chest_Advance({super.key});

  @override
  State<chest_Advance> createState() => _chest_AdvanceState();
}

class _chest_AdvanceState extends State<chest_Advance> {
  final firebaseRef = FirebaseFirestore.instance.collection('beginner').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:NestedScrollView(
        headerSliverBuilder:(BuildContext context , bool isScolled){
          return [
            SliverAppBar(
              elevation: 0,
              leading: IconButton(
                  onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Home_workout()));
                  },
                  icon: const Icon(Icons.arrow_back)
              ),
              expandedHeight: 150,
              floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('CHEST ADVANCE'),
                background: Image.asset("assets/picture.png",fit: BoxFit.cover),
              ),
            )];
        } ,
        body:SingleChildScrollView(
          child: Column(
            children: [
              const rowtitle_Work(title1: '10 min', title2: ' - 5 workout',),
              StreamBuilder<QuerySnapshot>(
                stream: firebaseRef,
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child:  CircularProgressIndicator(color: Colors.orange),
                    );
                  }
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  if (!snapshot.hasData) {
                    return const Text('No data available');
                  }
                  return ListView.builder(
                    shrinkWrap: true,                            // Set this to true
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot abs = snapshot.data!.docs[index];
                      return ListTile(
                        leading: Container(
                          height: 70,
                          width: 100,
                          child: Lottie.network(abs['image'],fit: BoxFit.fitHeight),
                        ),
                        trailing: const Icon(Icons.menu),
                        onTap: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Detail_Screen(Details: abs)));
                        },
                        title: Text(abs['title'].toString(),style: const TextStyle(fontWeight: FontWeight.bold),),
                        subtitle: Text(abs['subtitle'].toString()),
                        shape: const RoundedRectangleBorder(),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
