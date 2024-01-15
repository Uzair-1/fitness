// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/otpscreen.dart';
import 'package:fitness/utils/button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Login_phone extends StatefulWidget {
  const Login_phone({super.key});

  @override
  State<Login_phone> createState() => _Login_phoneState();
}

class _Login_phoneState extends State<Login_phone> {
  bool loading = false;
  String countryCode = '+92'; // Default country code
  final _keyForm = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  TextEditingController PhoneNumberController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    PhoneNumberController.dispose();
  }

  void SendOPT() {
    setState(() {
      loading = true;
    });
    if (_keyForm.currentState!.validate()) {
      final fullPhoneNumber = countryCode + PhoneNumberController.text;
      //print('Sending OTP to: $fullPhoneNumber'); // Debugging statement
      auth.verifyPhoneNumber(
        phoneNumber: fullPhoneNumber,
        verificationCompleted: (_) {
          //print('Verification completed.'); // Debugging statement
        },
        verificationFailed: (error) {
        //  print('Verification failed: $error'); // Debugging statement
          setState(() {
            loading = false;
          });
        },
        codeSent: (String VerificationId, int? Token) {
          //print('OTP sent successfully.');     // Debugging statement
          setState(() {
            loading = false;
          });
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => otp_Screen(verificationId: VerificationId),
            ),
          );
        },
        codeAutoRetrievalTimeout: (error) {
          //print('Auto retrieval timeout: $error'); // Debugging statement
          setState(() {
            loading = false;
          });
        },
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
            text: 'Phone',
            style: TextStyle(fontSize: 20, color: Colors.white),
            children: [
              TextSpan(text: ' Login', style: TextStyle(color: Colors.orange)),
            ],
          ),
        ),
      ),
      body: SafeArea(
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
              Form(
                key: _keyForm,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, right: 30, left: 30),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          readOnly: true,
                          controller: TextEditingController(text: countryCode),
                          decoration: InputDecoration(
                            prefixIcon: IconButton(
                              onPressed: () {
                                showCountryPicker(
                                  context: context,
                                  onSelect: (Country value) {
                                    setState(() {
                                      countryCode = '+${value.phoneCode}'; // '+' + value.phonecode!;
                                    });
                                  },
                                );
                              },
                              icon: const Icon(Icons.arrow_drop_down),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 3,
                        child: TextFormField(
                          controller: PhoneNumberController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText: 'Enter Phone Number',
                            suffixIcon: const Icon(Icons.call),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Phone Number";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 2.9),
              Custom_Button(
                title: 'Send OTP',
                loading: loading,
                ontap: () {
                  SendOPT();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
