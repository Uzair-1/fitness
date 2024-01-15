// ignore_for_file: camel_case_types, avoid_unnecessary_containers, sized_box_for_whitespace


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness/Homeworkout/Beginner/detailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:fitness/Homeworkout/home_work.dart';
import 'package:lottie/lottie.dart';

import '../../Widget/RowTitlework.dart';

class abs_beginner extends StatefulWidget {
  const abs_beginner({super.key});

  @override
  State<abs_beginner> createState() => _abs_beginnerState();
}

class _abs_beginnerState extends State<abs_beginner> {
  final firebaseRef = FirebaseFirestore.instance.collection('chest beginner').snapshots();

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
                title: const Text('ABS INTERMEDIATE'),
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
                      DocumentSnapshot arm = snapshot.data!.docs[index];
                      return ListTile(
                        leading: SizedBox(
                          height: 70,
                          width: 100,
                          child: Lottie.network(arm['image'] ?? ''), // Use a default value if 'image' is missing
                        ),
                        trailing: const Icon(Icons.menu),
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Detail_Screen(Details: arm)));
                        },
                        title: Text(arm['title']?.toString() ?? ''),
                        subtitle: Text(arm['subtitle']?.toString() ?? ''),
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
