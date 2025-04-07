import 'package:get/get.dart';
import 'package:getx_structure_template/app/data/remote/auth_remote_data_source.dart';

import '/app/data/remote/github_remote_data_source.dart';
import '/app/data/remote/github_remote_data_source_impl.dart';

class RemoteSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GithubRemoteDataSource>(
      () => GithubRemoteDataSourceImpl(),
      tag: (GithubRemoteDataSource).toString(),
    );
    Get.lazyPut<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(),
      tag: (AuthRemoteDataSource).toString(),
    );
  }
}
