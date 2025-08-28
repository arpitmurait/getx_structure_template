import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../core.dart';

class DeleteConfirmationDialog {
  static show(String title,String message, {required VoidCallback onYes,AlertType type = AlertType.none}) {
    Alert(
      context: Get.context!,
      type: type,
      style: AlertStyle(
          constraints: const BoxConstraints(minHeight: 200),
          isCloseButton: false,
          alertBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
          titleStyle: const TextStyle(
              color: AppColors.kPrimaryColor,
              fontSize: 18
          ),
      ),
      title: title,
      desc: message,
      buttons: [
        DialogButton(
          onPressed: () => Get.back(),
          color: AppColors.kDanger1,
          child: Text(
            AppStrings.no.tr,
            style: TextStyle(color: Colors.white),
          ),
        ),
        DialogButton(
          onPressed: () {
            Get.back();
            onYes.call();
          },
          color: AppColors.kPrimaryColor,
          child: Text(
            AppStrings.yes.tr,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    ).show();
  }
}