import 'package:fitness/Widget/dialogbutton.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AlertDialog_Screencustom extends StatelessWidget {
  final VoidCallback onQuitScan;
  final VoidCallback onResumeScan;
  final VoidCallback ontakelook;

  const AlertDialog_Screencustom({super.key,
    required this.onQuitScan,
    required this.onResumeScan,
    required this.ontakelook,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.orange.withOpacity(0.6),
      elevation: 0,
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            const SizedBox(height: 10,),
            const Text("Pause",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
            const Wrap(
              children: [
                Text(' bodily or mental exertion, especially for the sake of training or improvement of health:')
              ],
            ),
            const SizedBox(height: 20,),
            Lottie.asset('assets/animation_llkx8ye5.json',
              animate: true,
              height: 200,
            ),
            const SizedBox(height: 10),
            Dialog_button(
              title: 'Take A Look',
              ontap: ontakelook,
            ),

          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: onQuitScan,
              child: const Text(
                "QUIT",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            TextButton(
              onPressed: onResumeScan,
              child: const Text(
                "RESUME",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}