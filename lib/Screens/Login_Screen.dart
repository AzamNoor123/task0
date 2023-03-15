import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_0/Screens/LoginScreenController.dart';
import 'package:task_0/Screens/MainScreen.dart';

import 'CustomWidgets.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  loginController logincontroller = Get.put(loginController());
  TextEditingController passwdctr = TextEditingController();
  TextEditingController namectr = TextEditingController();
  TextEditingController emailctr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Screen")),
      body: SingleChildScrollView(
        child: Form(
            key: logincontroller.formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomTextField(
                    hinttext: 'Enter Name',
                    isenable: true,
                    labal: 'Name',
                    controller: namectr,


    ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomTextField(
                    hinttext: 'Enter Email',
                    isenable: true,
                    labal: 'Email',
                    controller: emailctr,

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomTextField(
                    hinttext: 'Enter Password',
                    labal: 'Password',
                    controller: passwdctr,
                    isenable: true,
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (logincontroller.formKey.currentState!.validate()) {
                        localStorage(
                            namectr.text, emailctr.text, passwdctr.text);
                        logincontroller.disablefield();

                        Get.to(MainScreen());
                      } else
                        return;
                    },
                    child: const Text("Submit"))
              ],
            )),
      ),
    );
  }

  localStorage(Name, Email, Passwd) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('Name', "$Name");
    pref.setString("Email", '$Email');
    pref.setString('Passwd', Passwd);
    pref.setBool('Session', true);
  }
}
