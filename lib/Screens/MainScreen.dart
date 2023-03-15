import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_0/Screens/LoginScreenController.dart';
import 'package:task_0/Screens/Login_Screen.dart';

import 'CustomWidgets.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  loginController maincontroller = Get.put(loginController());
  TextEditingController namectr = TextEditingController();
  TextEditingController emailctr = TextEditingController();
  TextEditingController passwdctr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    retrivedata();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Screen"),
        actions: [
          Center(
              child: GestureDetector(
                  onTap: () {
                    showdialog(context);
                  },
                  child: Text("Logout")))
        ],
        automaticallyImplyLeading: false,
      ),
      body: GetBuilder<loginController>(
        builder: (loginController) {
          return SingleChildScrollView(
            child: Form(
                key: maincontroller.formkey2,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CustomTextField(
                        hinttext: 'Enter Name',
                        isenable: maincontroller.enable.value,
                        labal: 'Name',
                        controller: namectr,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CustomTextField(
                        isenable: maincontroller.enable.value,
                        hinttext: 'Enter Email',
                        labal: 'Email',
                        controller: emailctr,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CustomTextField(
                        isenable: maincontroller.enable.value,
                        hinttext: 'Enter Password',
                        labal: 'Password',
                        controller: passwdctr,
                      ),
                    ),
                    maincontroller.enable == false
                        ? ElevatedButton(
                            onPressed: () {
                              if (maincontroller.formkey2.currentState!
                                  .validate()) {
                                maincontroller.retriveLocalstorage();
                                maincontroller.enablefield();
                              } else {
                                return;
                              }
                            },
                            child: const Text("Edit Field"))
                        : ElevatedButton(
                            onPressed: () {
                              LoginScreen().localStorage(
                                  namectr.text, emailctr.text, passwdctr.text);
                              maincontroller.disablefield();
                            },
                            child: Text("Done"))
                  ],
                )),
          );
        },
      ),
    );
  }

  retrivedata() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    namectr.text = pref.getString("Name").toString();
    emailctr.text = pref.getString("Email").toString();
    passwdctr.text = pref.getString("Passwd").toString();
    print("Retrive is called");
  }

  showdialog(context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Logout"),
              content: Text("Are you sure to logout"),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      maincontroller.clearSession();
                      Get.off(LoginScreen());
                    },
                    child: Text("Yes")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("NO"))
              ],
            ));
  }
}
