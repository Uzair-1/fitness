// ignore_for_file: unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:fitness/Dashborad.dart';
import 'package:fitness/Homeworkout/Beginner/absbeg.dart';
import 'package:fitness/DietPlan/diet.dart';
import 'package:fitness/phonelogin.dart';
import 'package:fitness/splachscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'CustomWorkoutScreen/Dodo/Models/notes_model.dart';
import 'Homeworkout/nextScreen.dart';
import 'UtilityCalculator/BMI/BmiCalculator.dart';
import 'UtilityCalculator/utilityCalculator.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var directory = await getApplicationDocumentsDirectory() ;
  Hive.init(directory.path);
  Hive.registerAdapter(NotesModelAdapter()) ;
  await Hive.openBox<NotesModel>('notes');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(720, 1600),   // Actual resolution of Oppo A31
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'My App',
          theme: ThemeData(
            brightness: Brightness.dark,
            useMaterial3: true,
          ),
          home:const SplachScreen(),     // You might need to adjust this to your initial screen
        );
      },
    );
  }
}
