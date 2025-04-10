import 'package:get/get.dart';
import 'package:getx_structure_template/app/data/model/model.dart';
import 'package:getx_structure_template/app/data/remote/users_remote_data_source.dart'
    show UsersRemoteDataSource;

abstract class UsersRepository {
  Future<UsersResponseModel> usersList(Map<String, dynamic> body);
}

class UsersRepositoryImpl implements UsersRepository {
  final UsersRemoteDataSource _remoteSource = Get.find(
    tag: (UsersRemoteDataSource).toString(),
  );

  @override
  Future<UsersResponseModel> usersList(Map<String, dynamic> body) {
    return _remoteSource.usersList(body);
  }
}
