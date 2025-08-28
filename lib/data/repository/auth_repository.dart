import '../../network/network.dart';
import '../local/hive/hive_manager.dart';
import '../model/model.dart';

/// Abstract class defining the contract for the authentication repository.
abstract class AuthRepository {
  Future<UserModel> login(Map<String, dynamic> body);
  Future<UserModel> register(Map<String, dynamic> body);
  Future<bool> forgotPassword(Map<String, dynamic> body);
  Future<bool> changePassword(Map<String, dynamic> body);
  Future<Map<String, dynamic>> checkValidated(Map<String, dynamic> body);
  Future<bool> sendOtp(Map<String, dynamic> body);
  Future<bool> verifyOtp(Map<String, dynamic> body);
}

/// The concrete implementation of the AuthRepository.
/// It uses the modern ApiService for all network calls and HiveManager for local storage.
class AuthRepositoryImpl implements AuthRepository {
  final HiveManager hiveManager;
  final ApiService apiService;

  AuthRepositoryImpl({required this.hiveManager, required this.apiService});

  /// Handles saving user data and token to Hive after a successful login or registration.
  void _persistUserData(String token, UserModel user) {
    hiveManager.setString(HiveManager.tokenKey, token);
    hiveManager.setInt(HiveManager.userIdKey, user.id);
    hiveManager.setString(HiveManager.emailKey, user.email);
    hiveManager.setString(HiveManager.phoneNumberKey, user.mobile);
    hiveManager.setString(HiveManager.fullNameKey, user.fullName);
    hiveManager.setString(HiveManager.imageKey, user.image ?? '');
  }

  @override
  Future<UserModel> login(Map<String, dynamic> body) async {
    try {
      final response = await apiService.post<UserResponseModel>(
        endpoint: AppUrls.login,
        data: body,
        fromJson: (json) => UserResponseModel.fromJson(json),
      );
      _persistUserData(response.token, response.data);
      return response.data;
    } catch (e) {
      // The ApiService handles showing the error toast.
      // Rethrowing allows the UI layer to know the login failed.
      rethrow;
    }
  }

  @override
  Future<UserModel> register(Map<String, dynamic> body) async {
    try {
      final response = await apiService.post<UserResponseModel>(
        endpoint: AppUrls.register,
        data: body,
        fromJson: (json) => UserResponseModel.fromJson(json),
      );
      _persistUserData(response.token, response.data);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> forgotPassword(Map<String, dynamic> body) async {
    try {
      // Assuming the API returns a simple success message, e.g., {"status": "success", "message": "..."}
      // We don't need to parse a complex model, just confirm it was successful.
      await apiService.post<void>(
        endpoint: AppUrls.forgotPassword,
        data: body,
        fromJson: (_) {},
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> changePassword(Map<String, dynamic> body) async {
    try {
      await apiService.post<void>(
        endpoint: AppUrls.changePassword,
        data: body,
        fromJson: (_) {},
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> sendOtp(Map<String, dynamic> body) async {
    try {
      await apiService.post<void>(
        endpoint: AppUrls.sendOtp,
        data: body,
        fromJson: (_) {},
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> verifyOtp(Map<String, dynamic> body) async {
    try {
      // Assuming the API returns a temporary token upon successful OTP verification.
      // e.g., {"data": {"temp_token": "some_token"}}
      final response = await apiService.post<Map<String, dynamic>>(
        endpoint: AppUrls.verifyOtp,
        data: body,
        fromJson: (json) => json, // Get the raw map
      );

      final tempToken = response['data']?['temp_token'] as String?;
      if (tempToken != null) {
        hiveManager.setString(HiveManager.tempTokenKey, tempToken);
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<Map<String, dynamic>> checkValidated(Map<String, dynamic> body) async {
    try {
      final response = await apiService.post<Map<String, dynamic>>(
        endpoint: AppUrls.checkValidated,
        data: body,
        fromJson: (json) => json, // Return the full response map
      );
      return response;
    } catch (e) {
      // Return an empty map or a map with an error flag on failure.
      return {'error': e.toString()};
    }
  }
}
