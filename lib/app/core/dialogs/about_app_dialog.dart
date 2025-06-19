import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutAppDialog {
  static show(){
    Get.dialog(AlertDialog(
      title: Text("Hello"),
    ));
  }
}