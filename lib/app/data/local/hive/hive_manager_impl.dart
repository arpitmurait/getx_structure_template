
import 'package:hive_flutter/hive_flutter.dart';

import '/app/data/local/hive/hive_manager.dart';

class HiveManagerImpl implements HiveManager {
  static var hiveBox = Hive.box(HiveManager.appName);

  @override
  String getString(String key, {String defaultValue = ""}) {
    return hiveBox.get(key,defaultValue: defaultValue);
  }

  @override
  void setString(String key, String value) {
    hiveBox.put(key, value);
  }

  @override
  int getInt(String key, {int defaultValue = 0}) {
    return hiveBox.get(key,defaultValue: defaultValue);
  }

  @override
  void setInt(String key, int value) {
    hiveBox.put(key, value);
  }

  @override
  double getDouble(String key, {double defaultValue = 0.0}) {
    return hiveBox.get(key,defaultValue: defaultValue);
  }

  @override
  void setDouble(String key, double value) {
    hiveBox.put(key, value);
  }

  @override
  bool getBool(String key, {bool defaultValue = false}) {
    return hiveBox.get(key,defaultValue: defaultValue);
  }

  @override
  void setBool(String key, bool value) {
    hiveBox.put(key, value);
  }

  @override
  List<String> getStringList(String key,
      {List<String> defaultValue = const []}) {
    return hiveBox.get(key,defaultValue: defaultValue);
  }

  @override
  void setStringList(String key, List<String> value) {
    hiveBox.put(key, value);
  }

  @override
  void clear() {
    setString(HiveManager.keyToken, "");
  }
}
