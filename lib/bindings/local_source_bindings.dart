import 'package:get/get.dart';

import '../network/api_service.dart';
import '/data/local/hive/hive_manager.dart';

class LocalSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HiveManager>(
      () => HiveManagerImpl(),
      tag: (HiveManager).toString(),
      fenix: true,
    );
    Get.lazyPut<ApiService>(
      () => ApiServiceImpl(),
      tag: (ApiService).toString(),
      fenix: true,
    );
  }
}
