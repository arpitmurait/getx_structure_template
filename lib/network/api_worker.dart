import 'package:dio/dio.dart';

import 'dio_provider.dart';
import 'error_handlers.dart';

/// A data class to encapsulate all information needed for an API request.
/// This object is passed from the main isolate to the background isolate.
class ApiRequest {
  final String method;
  final String endpoint;
  final String token;
  final dynamic data;
  final Map<String, dynamic>? queryParameters;

  ApiRequest({
    required this.method,
    required this.endpoint,
    required this.token,
    this.data,
    this.queryParameters,
  });
}

/// This function is designed to run in a separate isolate.
/// It performs the actual network request using Dio and returns the raw response data.
/// It throws custom exceptions on failure, which are caught in the main isolate.
Future<dynamic> apiWorker(ApiRequest request) async {
  try {
    // Get the pre-configured Dio instance which already handles tokens.
    final Dio dio = DioProvider.dioWithHeaderToken(request.token);

    Response response;
    switch (request.method.toUpperCase()) {
      case 'GET':
        response = await dio.get(
          request.endpoint,
          queryParameters: request.queryParameters,
        );
        break;
      case 'POST':
        response = await dio.post(
          request.endpoint,
          data: request.data,
          queryParameters: request.queryParameters,
        );
        break;
      case 'PUT':
        response = await dio.put(
          request.endpoint,
          data: request.data,
          queryParameters: request.queryParameters,
        );
        break;
      case 'PATCH':
        response = await dio.patch(
          request.endpoint,
          data: request.data,
          queryParameters: request.queryParameters,
        );
        break;
      case 'DELETE':
        response = await dio.delete(
          request.endpoint,
          data: request.data,
          queryParameters: request.queryParameters,
        );
        break;
      default:
        throw Exception("Unsupported HTTP method: ${request.method}");
    }
    // Return the raw JSON data (Map or List).
    // The main isolate will be responsible for parsing this into a model object.
    return response.data;
  } on DioException catch (e) {
    // Convert Dio-specific errors into our custom, structured exceptions.
    throw handleDioError(e);
  } catch (e) {
    // Handle any other generic errors.
    throw handleError(e.toString());
  }
}