import 'package:get/get.dart';
import 'package:getx_structure_template/app/data/repository/auth/auth_repository.dart';

import '../data/remote/auth_remote_data_source.dart';
import '../data/repository/users_repository.dart';

class RepositoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UsersRepository>(
      () => UsersRepositoryImpl(),
      tag: (UsersRepository).toString(),
    );
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(Get.find(
        tag: (AuthRemoteDataSource).toString(),
      )),
      tag: (AuthRepository).toString(),
    );
  }
}
