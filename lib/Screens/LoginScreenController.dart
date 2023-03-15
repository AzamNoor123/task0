import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey();
  GlobalKey<FormState> formkey2 = GlobalKey();
  TextEditingController namectr = TextEditingController();
  TextEditingController emailctr = TextEditingController();
  TextEditingController passwdctr = TextEditingController();
  RxBool enable = true.obs;

  retriveLocalstorage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(pref.getString('Name'));
    print(pref.getString('Email'));
    print(pref.getString('Passwd'));
    print("hello ");
  }

  disablefield() {
    enable = false.obs;
  }

  enablefield() {
    enable = true.obs;
    update();
  }

  clearSession() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("Session", false);
  }
}
