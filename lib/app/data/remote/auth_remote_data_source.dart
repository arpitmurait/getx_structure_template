
import 'package:getx_structure_template/app/core/base/base_remote_source.dart';
import 'package:getx_structure_template/app/data/model/user_model.dart';
import 'package:getx_structure_template/app/network/dio_provider.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(Map<String,dynamic> body);
  Future<UserModel> register(Map<String,dynamic> body);
}

class AuthRemoteDataSourceImpl extends BaseRemoteSource
    implements AuthRemoteDataSource {

  @override
  Future<UserModel> login(Map<String, dynamic> body) {
    var endpoint = "${DioProvider.baseUrl}/login";
    var dioCall = dioClient.post(endpoint, data: body);

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => UserModel.fromJson(response.data));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> register(Map<String, dynamic> body) {
    var endpoint = "${DioProvider.baseUrl}/register";
    var dioCall = dioClient.post(endpoint, data: body);

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => UserModel.fromJson(response.data));
    } catch (e) {
      rethrow;
    }
  }
}