
// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/Dashborad.dart';
import 'package:fitness/utils/button.dart';
import 'package:fitness/utils/error_handle.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class signUpScreen extends StatefulWidget {
  const signUpScreen({super.key});

  @override
  State<signUpScreen> createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {
  bool Loading = false;
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _passwordVisibility =false;

  final auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void SignUp(){
    setState(() {
      Loading = true;
    });
    if(_formkey.currentState!.validate()){
      auth.createUserWithEmailAndPassword(
          email: emailController.text.toString(),
          password: passwordController.text.toString(),
      ).then((value) {
        setState(() {
          Loading = false;
        });
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Dashborad_Screen()));
      }).onError((error, stackTrace) {
        ErrorHandle().showError(error.toString());
        setState(() {
          Loading = false;
        });
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text('Create Account'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height/3.6,
                  width: double.infinity,
                  child: Center(
                    child: Lottie.asset("assets/animation_llkzp441.json",height: 200),
                  )
              ),
              Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Padding(padding: const EdgeInsets.only(top: 20,right: 30,left: 30),
                        child:   TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                              hintText: 'Email',
                              suffixIcon: const Icon(Icons.email_outlined),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              )
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return "Enter Email";
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(padding: const EdgeInsets.only(top: 30,right: 30,left: 30),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: _passwordVisibility,
                          decoration: InputDecoration(
                              hintText: 'Password',
                              suffixIcon: IconButton(
                                splashRadius: 1,
                                icon: Icon(_passwordVisibility
                                    ? Icons.visibility
                                    : Icons.visibility_off,),
                                onPressed: (){
                                  setState(() {
                                    _passwordVisibility =!_passwordVisibility;
                                  });
                                },
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              )
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return "Enter Password";
                            }
                            else if(value.length<6){
                              return "Enter the 6 digits password";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  )
              ),
              SizedBox( height: MediaQuery.of(context).size.height/3.8,),
              Custom_Button(title: 'Signup',
                ontap: () {
                  SignUp();    // check the validation
                },loading: Loading,
               ),
            ],
          ),
        ),
      ),

    ));
  }
}
