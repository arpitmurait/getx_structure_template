import 'package:getx_structure_template/app/data/remote/auth_remote_data_source.dart';
import 'package:getx_structure_template/app/data/model/user_model.dart';

abstract class AuthRepository {
  Future<UserModel> login(Map<String, dynamic> body);
  Future<UserModel> register(Map<String, dynamic> body);
  Future<UserModel> forgotPassword(Map<String, dynamic> body);
  Future<UserModel> verifyOtp(Map<String, dynamic> body);
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteSource;
  AuthRepositoryImpl(this._remoteSource);

  @override
  Future<UserModel> login(Map<String, dynamic> body) {
    return _remoteSource.login(body);
  }

  @override
  Future<UserModel> register(Map<String, dynamic> body) {
    return _remoteSource.register(body);
  }

  @override
  Future<UserModel> forgotPassword(Map<String, dynamic> body) {
    return _remoteSource.forgotPassword(body);
  }

  @override
  Future<UserModel> verifyOtp(Map<String, dynamic> body) {
    return _remoteSource.verifyOtp(body);
  }
}
