import 'package:get/get.dart';

import '/app/data/local/hive/hive_manager.dart';

class LocalSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HiveManager>(
      () => HiveManagerImpl(),
      tag: (HiveManager).toString(),
    );
  }
}
