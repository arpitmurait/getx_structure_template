import 'base_api_exception.dart';

class ApiException extends BaseApiException {
  ApiException({
    required super.httpCode,
    required super.status,
    super.message,
  });
}
