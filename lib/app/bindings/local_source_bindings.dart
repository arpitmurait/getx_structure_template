import 'package:get/get.dart';

import '/app/data/local/hive/hive_manager.dart';
import '/app/data/local/hive/hive_manager_impl.dart';

class LocalSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HiveManager>(
      () => HiveManagerImpl(),
      tag: (HiveManager).toString(),
      fenix: true,
    );
  }
}
