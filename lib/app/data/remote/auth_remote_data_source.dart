import 'package:get/get.dart';
import 'package:getx_structure_template/app/core/base/base_remote_source.dart';
import 'package:getx_structure_template/app/data/local/hive/hive_manager.dart'
    show HiveManager, HiveManagerImpl;
import 'package:getx_structure_template/app/data/model/user_model.dart';
import 'package:getx_structure_template/app/network/dio_provider.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(Map<String, dynamic> body);
  Future<UserModel> register(Map<String, dynamic> body);
  Future<UserModel> forgotPassword(Map<String, dynamic> body);
  Future<UserModel> verifyOtp(Map<String, dynamic> body);
}

class AuthRemoteDataSourceImpl extends BaseRemoteSource
    implements AuthRemoteDataSource {
  final HiveManager hiveManager = Get.find(tag: (HiveManager).toString());
  @override
  Future<UserModel> login(Map<String, dynamic> body) {
    var endpoint = "${DioProvider.baseUrl}/login";
    var dioCall = dioClient.post(endpoint, data: body);

    try {
      return callApiWithErrorParser(dioCall).then((response) {
        var data = response.data['data'];
        var user = UserModel.fromJson(data['user']);
        hiveManager.setString(HiveManager.tokenKey, data['token']);
        hiveManager.setString(HiveManager.userIdKey, user.id);
        hiveManager.setString(HiveManager.emailKey, user.email);
        hiveManager.setString(HiveManager.phoneNumberKey, user.phoneNumber);
        hiveManager.setString(HiveManager.lastNameKey, user.lastName);
        hiveManager.setString(HiveManager.firstNameKey, user.firstName);
        return user;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> register(Map<String, dynamic> body) {
    var endpoint = "${DioProvider.baseUrl}/register";
    var dioCall = dioClient.post(endpoint, data: body);

    try {
      return callApiWithErrorParser(dioCall).then((response) {
        var data = response.data['data'];
        var user = UserModel.fromJson(data['user']);
        final HiveManagerImpl hiveManager = Get.find(
          tag: (HiveManager).toString(),
        );
        hiveManager.setString(HiveManager.tokenKey, data['token']);
        hiveManager.setString(HiveManager.userIdKey, user.id);
        hiveManager.setString(HiveManager.emailKey, user.email);
        hiveManager.setString(HiveManager.phoneNumberKey, user.phoneNumber);
        hiveManager.setString(HiveManager.lastNameKey, user.lastName);
        hiveManager.setString(HiveManager.firstNameKey, user.firstName);
        return user;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> forgotPassword(Map<String, dynamic> body) {
    var endpoint = "${DioProvider.baseUrl}/forgot-password";
    var dioCall = dioClient.post(endpoint, data: body);

    return callApiWithErrorParser(
      dioCall,
    ).then((response) => UserModel.fromJson(response.data));
  }

  @override
  Future<UserModel> verifyOtp(Map<String, dynamic> body) {
    var endpoint = "${DioProvider.baseUrl}/verify-otp";
    var dioCall = dioClient.post(endpoint, data: body);

    return callApiWithErrorParser(
      dioCall,
    ).then((response) => UserModel.fromJson(response.data));
  }
}
