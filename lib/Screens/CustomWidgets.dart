import 'package:flutter/material.dart';
import 'package:task_0/Screens/LoginScreenController.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {required this.labal,
      required this.hinttext,
      required this.controller,
      required this.isenable,});
  TextEditingController controller;
  String labal;
  String hinttext;
  bool isenable;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,


      // validator: (value) {
      //   if (value == null || value.isEmpty) {
      //     return 'Enter Credential';
      //   }
      // },
      autovalidateMode: AutovalidateMode.always,
      enabled: isenable,
      validator: (value){if(value==null || value.isEmpty){return 'Please enter credential as proper';} else return null;},
      decoration: InputDecoration(
          label: Text(labal),

          hintText: hinttext,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.black, width: 2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: Colors.black)),
          errorBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red))),
    );
  }
}
