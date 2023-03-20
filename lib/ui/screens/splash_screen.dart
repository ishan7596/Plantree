import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_onboarding/ui/screens/root_page.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../onboarding_screen.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  bool login = false;

  @override
  void initState() {

    // TODO: implement initState
    super.initState();

    SharedPreferences.getInstance().then((value) {
      login = value.getBool("login") ?? false;
      Future.delayed(Duration(seconds: 3),() {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => login  ? RootPage() : OnboardingScreen(),), (route) => false);

      },);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset("assets/images/62761-walking-pothos.json",height: 700),
      ),
    );
  }
}
