import '/app/core/base/base_remote_source.dart';
import '../model/users_response.dart';
import '/app/network/dio_provider.dart';

abstract class UsersRemoteDataSource {
  Future<UsersResponseModel> usersList(Map<String, dynamic> body);
}

class UsersRemoteDataSourceImpl extends BaseRemoteSource
    implements UsersRemoteDataSource {
  @override
  Future<UsersResponseModel> usersList(Map<String, dynamic> body) {
    var endpoint = "${DioProvider.baseUrl}/get-all-user";
    var dioCall = dioClient.post(endpoint, data: body);

    return callApiWithErrorParser(
      dioCall,
    ).then((response) => UsersResponseModel.fromJson(response.data));
  }
}
