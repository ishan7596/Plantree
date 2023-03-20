import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding/ui/screens/root_page.dart';
import 'package:flutter_onboarding/ui/screens/splash_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ui/onboarding_screen.dart';



void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {

    return  GetMaterialApp(
      title: 'Onboarding Screen',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green.shade900,
      ),
      home: Splash(),
      // home:login  ? RootPage() : OnboardingScreen() ,
      debugShowCheckedModeBanner: false,
    );
  }
}
