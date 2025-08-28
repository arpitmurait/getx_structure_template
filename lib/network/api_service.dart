import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:getx_structure_template/data/local/hive/hive_manager.dart';

import '../core/core.dart';
import '../routes/app_pages.dart';
import 'api_worker.dart';
import 'exceptions/app_exception.dart';
import 'exceptions/base_api_exception.dart';
import 'exceptions/unauthorize_exception.dart';

/// Abstract class defines the contract for our API service.
/// This is useful for dependency injection and creating mock implementations for tests.
abstract class ApiService {
  Future<T> get<T>({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic data) fromJson,
    bool showLoading = true,
  });

  Future<T> post<T>({
    required String endpoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic data) fromJson,
    bool showLoading = true,
  });

  Future<T> put<T>({
    required String endpoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic data) fromJson,
    bool showLoading = true,
  });

  Future<T> patch<T>({
    required String endpoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic data) fromJson,
    bool showLoading = true,
  });

  Future<T> delete<T>({
    required String endpoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic data) fromJson,
    bool showLoading = true,
  });
}

/// The concrete implementation of the ApiService.
class ApiServiceImpl implements ApiService {

  /// A generic, private request handler that abstracts the common logic for all HTTP methods.
  Future<T> _request<T>(
      String method, {
        required String endpoint,
        dynamic data,
        Map<String, dynamic>? queryParameters,
        required T Function(dynamic data) fromJson,
        bool showLoading = true,
        bool closeLoading = true,
      }) async {
    if (showLoading) Utils.showLoading();
    HiveManager hiveManager = Get.find(tag: (HiveManager).toString());

    try {
      final request = ApiRequest(
        method: method,
        endpoint: endpoint,
        data: data,
        token: hiveManager.getString(HiveManager.tokenKey),
        queryParameters: queryParameters,
      );

      // Execute the apiWorker function in a separate isolate.
      final responseData = await compute(apiWorker, request);

      // Once the raw data is back, parse it into the desired model type.
      // This happens back on the main isolate but is typically very fast.
      return fromJson(responseData);

    } on UnauthorizedException catch (e) {
      // Specifically handle token expiry/unauthorized errors.
      Utils.showToast(e.message);
      Get.offAllNamed(AppRoutes.login);
      rethrow; // Re-throw so the calling repository knows the request failed.
    } on Exception catch (e) {
      // Handle all other custom or generic exceptions.
      _showErrorToast(e);
      rethrow;
    } finally {
      // Ensure the loading indicator is always closed.
      if (closeLoading) Utils.closeLoading();
    }
  }

  /// A helper to extract and display the error message from our custom exceptions.
  void _showErrorToast(Exception e) {
    String message = "An unknown error occurred. Please try again.";
    if (e is BaseApiException) {
      message = e.message;
    } else if (e is AppException) {
      message = e.message;
    }
    Utils.showToast(message);
  }

  @override
  Future<T> get<T>({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic data) fromJson,
    bool showLoading = true,
    bool closeLoading = true,
  }) =>
      _request(
        'GET',
        endpoint: endpoint,
        queryParameters: queryParameters,
        fromJson: fromJson,
        showLoading: showLoading,
        closeLoading: closeLoading,
      );

  @override
  Future<T> post<T>({
    required String endpoint,
    data,
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic data) fromJson,
    bool showLoading = true,
    bool closeLoading = true,
  }) =>
      _request(
        'POST',
        endpoint: endpoint,
        data: data,
        queryParameters: queryParameters,
        fromJson: fromJson,
        showLoading: showLoading,
        closeLoading: closeLoading,
      );

  @override
  Future<T> put<T>({
    required String endpoint,
    data,
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic data) fromJson,
    bool showLoading = true,
    bool closeLoading = true,
  }) =>
      _request(
        'PUT',
        endpoint: endpoint,
        data: data,
        queryParameters: queryParameters,
        fromJson: fromJson,
        showLoading: showLoading,
        closeLoading: closeLoading,
      );

  @override
  Future<T> patch<T>({
    required String endpoint,
    data,
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic data) fromJson,
    bool showLoading = true,
    bool closeLoading = true,
  }) =>
      _request(
        'PATCH',
        endpoint: endpoint,
        data: data,
        queryParameters: queryParameters,
        fromJson: fromJson,
        showLoading: showLoading,
        closeLoading: closeLoading,
      );

  @override
  Future<T> delete<T>({
    required String endpoint,
    data,
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic data) fromJson,
    bool showLoading = true,
    bool closeLoading = true,
  }) =>
      _request(
        'DELETE',
        endpoint: endpoint,
        data: data,
        queryParameters: queryParameters,
        fromJson: fromJson,
        showLoading: showLoading,
        closeLoading: closeLoading,
      );
}