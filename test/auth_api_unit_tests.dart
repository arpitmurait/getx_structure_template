import 'package:flutter_test/flutter_test.dart';
import 'package:getx_structure_template/app/data/local/hive/hive_manager.dart';
import 'package:getx_structure_template/app/data/model/user_model.dart';
import 'package:getx_structure_template/app/data/remote/auth_remote_data_source.dart';
import 'package:getx_structure_template/app/data/repository/auth/auth_repository.dart';
import 'package:getx_structure_template/flavors/build_config.dart';
import 'package:getx_structure_template/flavors/env_config.dart';
import 'package:getx_structure_template/flavors/environment.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'auth_api_unit_tests.mocks.dart';

@GenerateMocks([
  HiveManager,
  AuthRemoteDataSource,
  Dio,
  AuthRepository,
])
void main() {
  setUp(() {
    BuildConfig.instantiate(envConfig: EnvConfig(
      appName: "dev_demo",
      baseUrl: "https://demo-auth-backend.vercel.app",
      shouldCollectCrashLog: true,
    ),envType: Environment.DEVELOPMENT); // or ProdEnvironmentConfig / TestEnvironmentConfig

    var hiveManager = HiveManagerImpl();
    Get.put<HiveManager>(hiveManager);
    var auth = AuthRemoteDataSourceImpl(hiveManager: hiveManager);
    Get.put<AuthRemoteDataSource>(auth,);
    Get.put<AuthRepository>(AuthRepositoryImpl(auth));
  });

  group('AuthRepository Tests', () {
    MockHiveManager hiveManager = MockHiveManager();
    MockAuthRepository authRepository = MockAuthRepository();

    test('login success', () async {
      final user = UserModel(
        firstName: 'John',
        lastName: 'Doe',
        email: 'john@gmail.com',
        phoneNumber: '1234567890',
        id: '1',
        role: 'user',
      );

      when(
        authRepository.login({
          'email': 'john@gmail.com',
          'password': 'john123',
        }),
      ).thenAnswer((_) async => user);
      final result = await authRepository.login({
        'email': 'john@gmail.com',
        'password': 'john123',
      });
      expect(result, isA<UserModel>());
      expect(result.firstName, 'John');
      expect(result.lastName, 'Doe');
      verify(authRepository.login({
        'email': 'john@gmail.com',
        'password': 'john123',
      })).called(1);
      // verify(hiveManager.setString(HiveManager.userIdKey, user.id)).called(1);
      verify(() => hiveManager.setString(HiveManager.userIdKey, '1')).called(1);
      verify(() => hiveManager.setString(HiveManager.emailKey, 'test@example.com')).called(1);
      verify(() => hiveManager.setString(HiveManager.firstNameKey, 'Test')).called(1);
      verify(() => hiveManager.setString(HiveManager.lastNameKey, 'User')).called(1);
      verify(() => hiveManager.setString(HiveManager.phoneNumberKey, '1234567890')).called(1);

      // verify(
      //   mockHiveManager.setString(HiveManager.emailKey, user.email)
      // ).called(1);
      // verify(
      //   mockHiveManager.setString(HiveManager.phoneNumberKey, user.phoneNumber)
      // ).called(1);
      // verify(
      //   mockHiveManager.setString(HiveManager.lastNameKey, user.lastName)
      // ).called(1);
      // verify(
      //   mockHiveManager.setString(HiveManager.firstNameKey, user.firstName)
      // ).called(1);
    });
    // test('register success', () async {
    //   final user = UserModel(
    //     firstName: 'Jane',
    //     lastName: 'Doe',
    //     email: 'john@gmail.com',
    //     phoneNumber: '1234567890',
    //     id: '2',
    //     role: 'user',
    //   );
    //   when(
    //     mockAuthRemoteDataSource.register(user.toJson()),
    //   ).thenAnswer((_) async => user);
    //   final result = await authRepository.register({
    //     'email': 'john@gmail.com',
    //     'password': 'john123',
    //     'first_name': 'Jane',
    //     'last_name': 'Doe',
    //     'phone_number': '1234567890',
    //   });
    //   expect(result, isA<UserModel>());
    //   expect(result.firstName, 'Jane');
    //   expect(result.lastName, 'Doe');
    //   verify(mockAuthRemoteDataSource.register(user.toJson())).called(1);
    //   verify(
    //     mockHiveManager.setString(HiveManager.userIdKey, user.id),
    //   ).called(1);
    //   verify(
    //     mockHiveManager.setString(HiveManager.emailKey, user.email),
    //   ).called(1);
    //   verify(
    //     mockHiveManager.setString(HiveManager.phoneNumberKey, user.phoneNumber),
    //   ).called(1);
    //   verify(
    //     mockHiveManager.setString(HiveManager.lastNameKey, user.lastName),
    //   ).called(1);
    //   verify(
    //     mockHiveManager.setString(HiveManager.firstNameKey, user.firstName),
    //   ).called(1);
    // });
    // test('forgotPassword success', () async {
    //   final user = UserModel(
    //     firstName: 'John',
    //     lastName: 'Doe',
    //     email: 'john@gmail.com',
    //     phoneNumber: '1234567890',
    //     id: '1',
    //     role: 'user',
    //   );
    //   when(
    //     mockAuthRemoteDataSource.forgotPassword(user.toJson()),
    //   ).thenAnswer((_) async => user);
    //   final result = await authRepository.forgotPassword({
    //     'email': 'john@gmail.com',
    //     'phone_number': '1234567890',
    //   });
    //   expect(result, isA<UserModel>());
    //   expect(result.email, 'john@gmail.com');
    //   expect(result.phoneNumber, '1234567890');
    //   verify(mockAuthRemoteDataSource.forgotPassword(user.toJson())).called(1);
    //   verify(
    //     mockHiveManager.setString(HiveManager.emailKey, user.email),
    //   ).called(1);
    //   verify(
    //     mockHiveManager.setString(HiveManager.phoneNumberKey, user.phoneNumber),
    //   ).called(1);
    //   verify(
    //     mockHiveManager.setString(HiveManager.lastNameKey, user.lastName),
    //   ).called(1);
    //   verify(
    //     mockHiveManager.setString(HiveManager.firstNameKey, user.firstName),
    //   ).called(1);
    // });
    // test('verifyOtp success', () async {
    //   final user = UserModel(
    //     firstName: 'John',
    //     lastName: 'Doe',
    //     email: 'john@gmail.com',
    //     phoneNumber: '1234567890',
    //     id: '1',
    //     role: 'user',
    //   );
    //   when(
    //     mockAuthRemoteDataSource.verifyOtp(user.toJson()),
    //   ).thenAnswer((_) async => user);
    //   final result = await authRepository.verifyOtp({
    //     'email': 'john@gmail.com',
    //     'otp': '123456',
    //   });
    //   expect(result, isA<UserModel>());
    //   expect(result.firstName, 'John');
    //   expect(result.lastName, 'Doe');
    //   verify(mockAuthRemoteDataSource.verifyOtp(user.toJson())).called(1);
    //   verify(
    //     mockHiveManager.setString(HiveManager.emailKey, user.email),
    //   ).called(1);
    //   verify(
    //     mockHiveManager.setString(HiveManager.phoneNumberKey, user.phoneNumber),
    //   ).called(1);
    //   verify(
    //     mockHiveManager.setString(HiveManager.lastNameKey, user.lastName),
    //   ).called(1);
    //   verify(
    //     mockHiveManager.setString(HiveManager.firstNameKey, user.firstName),
    //   ).called(1);
    // });
  });
}
