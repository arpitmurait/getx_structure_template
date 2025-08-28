import 'package:get/get.dart';
import '../data/local/hive/hive_manager.dart';
import '../data/repository/auth_repository.dart';
import '../network/network.dart';

class RepositoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(
        hiveManager: Get.find(tag: (HiveManager).toString()),
        apiService: Get.find(tag: (ApiService).toString()),
      ),
      tag: (AuthRepository).toString(),
      fenix: true,
    );
  }
}
