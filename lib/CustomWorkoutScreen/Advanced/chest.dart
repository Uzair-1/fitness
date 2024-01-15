// ignore_for_file: camel_case_types, avoid_unnecessary_containers, sized_box_for_whitespace


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../Widget/RowTitlework.dart';
import '../custom_Workout.dart';
import '../detailsScreen.dart';

class chestadv_Cus extends StatefulWidget {
  const chestadv_Cus({super.key});

  @override
  State<chestadv_Cus> createState() => _chestadv_CusState();
}

class _chestadv_CusState extends State<chestadv_Cus> {
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const Customworkout()));
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
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Detail_Screencustom(Details: abs)));
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
