// ignore_for_file: non_constant_identifier_names, camel_case_types, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/login.dart';
import 'package:fitness/utils/button.dart';
import 'package:fitness/utils/error_handle.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class Forget_Screen extends StatefulWidget {
  const Forget_Screen({super.key});

  @override
  State<Forget_Screen> createState() => _Forget_ScreenState();
}

class _Forget_ScreenState extends State<Forget_Screen> {
  bool loading = false;
  TextEditingController emailController = TextEditingController();
  final auth = FirebaseAuth.instance;

  void ForgetPassword(){
    setState(() {
      loading = true;
    });
    auth.sendPasswordResetEmail(
      email:  emailController.text.toString(),
    ).then((value) {
      setState(() {
        loading = false;
      });
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
    }).onError((error, stackTrace){
      ErrorHandle().showError('Please Enter Email');
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
          },),
        centerTitle: true,
        elevation: 0,
        title:  RichText(text: const TextSpan(
          text: 'Forget',style: TextStyle(fontSize: 20),
          children: [
            TextSpan(text: 'Password',style: TextStyle(color: Colors.orange)),
          ]
        ))
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height/3.5,
                  width: double.infinity,
                  child: Center(
                    child: Lottie.asset("assets/animation_llkzp441.json",height: 200),
                  )
              ),
              const SizedBox(height: 10,),
              const Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child:  Wrap(
                  children: [
                    Text("Enter the Mail,\nTo change the Password" , style: TextStyle(fontSize: 20),),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Padding(padding: const EdgeInsets.only(top: 30,right: 30,left: 30),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: 'Enter Email ',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Enter Correct Email";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox( height: MediaQuery.of(context).size.height/3.9,),
              Custom_Button(title: 'Confirm',loading: loading,
                ontap: () {
                ForgetPassword();
                },),
            ],
          ),
        ),
      ),
    );
  }
}