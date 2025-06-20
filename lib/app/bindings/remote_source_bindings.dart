import 'package:get/get.dart';
import 'package:getx_structure_template/app/data/remote/auth_remote_data_source.dart';

import '../data/local/hive/hive_manager.dart';
import '../data/remote/users_remote_data_source.dart';

class RemoteSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UsersRemoteDataSource>(
      () => UsersRemoteDataSourceImpl(),
      tag: (UsersRemoteDataSource).toString(),
    );
    Get.lazyPut<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        hiveManager: Get.find(tag: (HiveManager).toString()),
      ),
      tag: (AuthRemoteDataSource).toString(),
    );
  }
}
