import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutAppSheet {
  static show(){
    Get.bottomSheet(BottomSheet(
      builder: (context) {
        return Container(
          height: 200,
          width: 200,
          color: Colors.green,
        );
      },
      onClosing: () {  },
    ));
  }
}