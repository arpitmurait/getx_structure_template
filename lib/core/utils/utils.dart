import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../core.dart';

///  this class contains small functions like validation and checking
///  functions that we can use in all pages.

bool checkResponse(int? code){
 return (code == 200 || code == 201) ? true : false;
}

class Utils {
 static showToast(String value) {
  Fluttertoast.showToast(
   msg: value,
   toastLength: Toast.LENGTH_SHORT,
   gravity: ToastGravity.BOTTOM,
   timeInSecForIosWeb: 1,
   textColor: Colors.white,
   backgroundColor: Colors.black,
   fontSize: 16.0,
  );
 }

 static bool isValidEmail(String? value) => RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value ?? '');

 static Future<bool> isInternetConnected() async {
  List<ConnectivityResult> connectivityResult = await Connectivity().checkConnectivity();
  return connectivityResult.isNotEmpty;
 }

 static showLoading(){
  EasyLoading.show(status: 'Loading...',indicator: CircularProgressIndicator(color: AppColors.kPrimaryColor,),dismissOnTap: false,maskType: EasyLoadingMaskType.black);
 }

 static closeLoading() {
  EasyLoading.dismiss();
 }

 static openDatePicker(BuildContext context,Function(DateTime?) onDone,{DateTime? initDate}){
  showDatePicker(
   context: context,
   initialDate: initDate ?? DateTime.now(),
   firstDate: DateTime(1900),
   lastDate: DateTime(5000),
   builder: (context, child) {
    return Theme(
     data: Theme.of(context).copyWith(
      colorScheme: ColorScheme.light(
      ),
     ),
     child: child!,
    );
   },
  ).then((value) => onDone(value));
 }
}