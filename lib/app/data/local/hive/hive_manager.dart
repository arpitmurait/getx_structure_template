import 'package:hive_flutter/hive_flutter.dart';

abstract class HiveManager {
  static const appName = "appName";
  static const tokenKey = "tokenKey";
  static String userIdKey = "userIdKey";
  static String emailKey = "emailKey";
  static String phoneNumberKey = "phoneNumberKey";
  static String lastNameKey = "lastNameKey";
  static String firstNameKey = "firstNameKey";

  String getString(String key, {String defaultValue = ""});

  void setString(String key, String value);

  int getInt(String key, {int defaultValue = 0});

  void setInt(String key, int value);

  double getDouble(String key, {double defaultValue = 0.0});

  void setDouble(String key, double value);

  bool getBool(String key, {bool defaultValue = false});

  void setBool(String key, bool value);

  List<String> getStringList(
    String key, {
    List<String> defaultValue = const [],
  });

  void setStringList(String key, List<String> value);

  void clear();
}

class HiveManagerImpl implements HiveManager {
  static var hiveBox = Hive.box(HiveManager.appName);

  @override
  String getString(String key, {String defaultValue = ""}) {
    return hiveBox.get(key, defaultValue: defaultValue);
  }

  @override
  void setString(String key, String value) {
    hiveBox.put(key, value);
  }

  @override
  int getInt(String key, {int defaultValue = 0}) {
    return hiveBox.get(key, defaultValue: defaultValue);
  }

  @override
  void setInt(String key, int value) {
    hiveBox.put(key, value);
  }

  @override
  double getDouble(String key, {double defaultValue = 0.0}) {
    return hiveBox.get(key, defaultValue: defaultValue);
  }

  @override
  void setDouble(String key, double value) {
    hiveBox.put(key, value);
  }

  @override
  bool getBool(String key, {bool defaultValue = false}) {
    return hiveBox.get(key, defaultValue: defaultValue);
  }

  @override
  void setBool(String key, bool value) {
    hiveBox.put(key, value);
  }

  @override
  List<String> getStringList(
    String key, {
    List<String> defaultValue = const [],
  }) {
    return hiveBox.get(key, defaultValue: defaultValue);
  }

  @override
  void setStringList(String key, List<String> value) {
    hiveBox.put(key, value);
  }

  @override
  void clear() {
    setString(HiveManager.tokenKey, "");
  }
}
