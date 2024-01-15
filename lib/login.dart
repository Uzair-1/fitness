// ignore_for_file: sized_box_for_whitespace, non_constant_identifier_names, use_build_context_synchronously, unrelated_type_equality_checks

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/forget.dart';
import 'package:fitness/phonelogin.dart';
import 'package:fitness/signup.dart';
import 'package:fitness/utils/button.dart';
import 'package:fitness/utils/error_handle.dart';
import 'package:flutter/material.dart';
import 'Dashborad.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _passwordVisibility = false;

  final auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void Login(){
    setState(() {
      loading = true;
    });
    if(_formKey.currentState!.validate()){
      auth.signInWithEmailAndPassword(
          email: emailController.text.toString(),
          password: passwordController.text.toString(),
      ).then((value){
        setState(() {
          loading = false;
        });
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Dashborad_Screen()));
      }).onError((error, stackTrace) {
        ErrorHandle().showError('First Create Account');
        setState(() {
          loading = false;
        });
      });

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        // leading: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
        title:RichText(
          text: const TextSpan(
            text: 'Log',
            style: TextStyle(fontSize: 20, color: Colors.white),
            children: [
              TextSpan(text: 'In', style: TextStyle(color: Colors.orange)),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView( // Wrap everything in a SingleChildScrollView
          child: Container(
            height: MediaQuery.of(context).size.height, // Set a fixed height for the container
            child: Stack(
              children: [
                Image.asset(
                 "assets/picture.png",
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Center(
                  child: Container(
                      height: MediaQuery.of(context).size.height/1.5,
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              SizedBox(height: MediaQuery.of(context).size.height/12,),
                                Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: (){},
                                    // onTap: () async {
                                    //   GoogleSignIn googleSign = GoogleSignIn();
                                    //   try {
                                    //     await googleSign.signIn();
                                    //     if (googleSign.currentUser != null) {
                                    //       print(googleSign.currentUser!.displayName); // Added a null check operator here
                                    //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Dashborad_Screen()));
                                    //     } else {
                                    //       print('Google Sign-In failed or user is null.');
                                    //     }
                                    //   } catch (error) {
                                    //     print('Error during Google Sign-In: $error');
                                    //   }
                                    // },
                                    child: const CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.orangeAccent,
                                      child: Text('G', style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold)),
                                    ),
                                  ),

                                  GestureDetector(
                                    onTap: (){},
                                    child:  const CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Colors.orangeAccent,
                                        child: Text('f',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),)
                                    ),
                                  ),
                                   CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.orangeAccent,
                                      child: IconButton(onPressed: (){
                                       Navigator.push(context, MaterialPageRoute(builder: (context)=>const Login_phone()));
                                      }, icon: const Icon(Icons.call,size: 25,color: Colors.black,)),
                                  )],
                              ),
                              const SizedBox(height: 20),
                              Text(
                                '-or with email-',
                                style: TextStyle(color: Colors.grey.shade300,fontSize: 16),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20, right: 30, left: 30),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: 'Email',
                                    fillColor: Colors.black54,
                                    filled: true,
                                    suffixIcon: const Icon(Icons.email_outlined,color: Colors.orange,),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  controller: emailController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your email';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20, right: 30, left: 30),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    fillColor: Colors.black54,
                                    filled: true,
                                    hintText: 'Password',
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _passwordVisibility = !_passwordVisibility;
                                        });
                                      },
                                      icon: Icon(
                                        _passwordVisibility
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  controller: passwordController,
                                  obscureText: !_passwordVisibility,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your password';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                             Padding(padding: const EdgeInsets.only(top: 20, right: 30, left: 30),
                             child:  Wrap(
                               children: [
                                 TextButton(
                                   onPressed: (){
                                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const signUpScreen()));
                                   },
                                   child: RichText(
                                     text: const TextSpan(
                                         text: 'Create',style: TextStyle(fontSize: 16),
                                         children: [
                                           TextSpan(text:'Account',style: TextStyle(color: Colors.orange))
                                         ]
                                     ),
                                   ),
                                 ),
                                TextButton(
                                    onPressed: (){
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Forget_Screen()));
                                    },
                                    child: RichText(
                                      text: const TextSpan(
                                          text: 'Forget',style: TextStyle(fontSize: 16),
                                          children: [
                                            TextSpan(text:'Password',style: TextStyle(color: Colors.orange))
                                          ]
                                      ),
                                    ),
                                )
                               ],
                             ),
                             ),
                              SizedBox(height: MediaQuery.of(context).size.height/20,),
                              Custom_Button(
                                title: 'Continue',
                                ontap: () {
                                  Login();
                                },
                                loading: loading,
                              ),
                            ],
                          ),
                        ),
                      )
                    ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

