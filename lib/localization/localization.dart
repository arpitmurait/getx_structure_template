import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ar.dart';
import 'en.dart';

///  this class contains Localization Service make available app in multiple language.

List<Locale> supportedLocales = [
  Locale("en"),
  Locale("ar"),
];

List<String> languageNames = ["English", "العربية"];

String getLanguageCodeFromName(String name){
  String code = 'en';
   switch(name) {
     case "English":
       return 'en';
     case "العربية" :
       return "ar";
  }
  return code;
}

String getLanguageNameFromCode(String name){
  String code = 'English';
   switch(name) {
     case "en":
       return 'English';
     case "ar" :
       return "العربية";
  }
  return code;
}

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': En.keys,
    'ar': Ar.keys,
  };
}
