// ignore_for_file: file_names, deprecated_member_use, camel_case_types, duplicate_ignore, unused_import, non_constant_identifier_names, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/Dashborad.dart';
import 'package:fitness/signup.dart';
import 'package:fitness/utils/outlinebuttonfill.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

// ignore: camel_case_types
class createScreen extends StatefulWidget {
  const createScreen({super.key});

  @override
  State<createScreen> createState() => _createScreenState();
}

class _createScreenState extends State<createScreen> {
  bool loading  = false;
  bool loading2  = false;

  Future<void> SigInWithGoogle() async{
    // create firebase instance here
    FirebaseAuth auth = FirebaseAuth.instance;
    // create google instance here
    final GoogleSignIn googleSignIn = GoogleSignIn();
    // trigger the authentication/ account flow
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    // create the request
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
    // create the new credential
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    // signing with Google with Credential
    final UserCredential userCredential = await auth.signInWithCredential(credential);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back)),
        title: const Text('Sign Up'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height/5,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Welcome let's Customize\nFitme for your goals",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),)
                  ],
                ),
              SizedBox(height: MediaQuery.of(context).size.height/20,),
              outLinebutton(title: 'Continue', loading: loading, ontap: () {
                setState(() {
                  loading = true;
                });
               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const signUpScreen()));
              },),
              SizedBox(height: MediaQuery.of(context).size.height/30,),
              const Text('OR',style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(height: MediaQuery.of(context).size.height/20,),
              Container(
                width: 250,
                margin: const EdgeInsets.all(4.0),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    primary: Colors.white,
                  ),
                 onPressed: ()async{
                  await SigInWithGoogle();
                  if(mounted){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const Dashborad_Screen()));
                  }
                 },
                  // onPressed: () async {
                  //   GoogleSignIn gSn = GoogleSignIn();
                  //   try {
                  //     await gSn.signIn();
                  //     if (gSn.currentUser != null) {
                  //       print(gSn.currentUser!.displayName ?? 'No display name');
                  //       print(gSn.currentUser!.email);
                  //       Future.delayed(const Duration(seconds: 5), () {
                  //         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Dashborad_Screen()));
                  //       });
                  //     } else {
                  //       print('Google Sign-In failed or user is null.');
                  //     }
                  //   } catch (error) {
                  //     print('Error during Google Sign-In: $error');
                  //   }
                  //   setState(() {
                  //     loading2 = true;
                  //   });
                  // },
                  child: RichText(
                    text: const TextSpan(
                      text: 'Continue with Google',
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height/30,),
              const Text('You will never post any thing without permission',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),),
            ],
          ),
        ),
        ),
      ),
    );
  }
}
