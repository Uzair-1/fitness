// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names, camel_case_types

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/Dashborad.dart';
import 'package:fitness/utils/button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class otp_Screen extends StatefulWidget {
  final String verificationId;

  const otp_Screen({Key? key, required this.verificationId}) : super(key: key);

  @override
  State<otp_Screen> createState() => _otp_ScreenState();
}

class _otp_ScreenState extends State<otp_Screen> {
  bool loading = false;
  final auth = FirebaseAuth.instance;
  final OtpFieldController otpController = OtpFieldController();
  String OtpValue = '';

  void confirmOTP() async {
    setState(() {
      loading = true;
    });

    final credential = PhoneAuthProvider.credential(
      verificationId: widget.verificationId,
      smsCode: OtpValue,
    );

    try {
      await auth.signInWithCredential(credential);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Dashborad_Screen(),
        ),
      );
    } catch (error) {
      setState(() {
        loading = false;
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Dashborad_Screen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: RichText(
          text: const TextSpan(
            text: '',
            style: TextStyle(fontSize: 20, color: Colors.white),
            children: [
              TextSpan(text: ' OTP', style: TextStyle(color: Colors.orange)),
            ],
          ),
        ),
      ),
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 3.3,
                width: double.infinity,
                child: Center(
                  child: Lottie.asset("assets/animation_llkzp441.json", height: 200),
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Verification Code", style: TextStyle(fontSize: 20)),
                ],
              ),
              Form(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30, right: 30, left: 30),
                      child: Card(
                        color:Colors.orange,
                        child: OTPTextField(
                          length: 6,
                          width: MediaQuery.of(context).size.width,
                          fieldWidth: 40,
                          keyboardType: TextInputType.number,
                          obscureText: true,
                          outlineBorderRadius: 15,
                          textFieldAlignment: MainAxisAlignment.spaceAround,
                          fieldStyle: FieldStyle.box,
                          onCompleted: (pin) {
                            setState(() {
                              OtpValue = pin;
                            });
                          },
                          onChanged: (pin){
                            setState(() {
                              OtpValue = pin;
                            });
                          },
                          controller: otpController,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 3.2),
              Custom_Button(
                title: 'Confirm OTP',
                loading: loading,
                ontap: () {
                  confirmOTP();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
