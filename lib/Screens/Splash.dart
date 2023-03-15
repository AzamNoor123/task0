import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:task_0/Screens/Login_Screen.dart';
import 'package:task_0/Screens/MainScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    initialization();
  }

  void initialization() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var session = pref.getBool('Session');
    print(session);
    await Future.delayed(const Duration(seconds: 3), () {
      if (session == true) {
        Get.offAll(MainScreen());
      } else {
        Get.off(LoginScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset('assets/download.png')),
    );
  }
}
