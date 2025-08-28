import 'package:dio/dio.dart';
import '../core/constant/constant.dart';
import 'app_urls.dart';
import 'pretty_dio_logger.dart';
import 'request_headers.dart';

class DioProvider {

  static Dio? _instance;

  static const int _maxLineWidth = 90;
  static final _prettyDioLogger = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: inDevelopment,
    responseHeader: false,
    error: true,
    compact: true,
    maxWidth: _maxLineWidth,
  );

  static final BaseOptions _options = BaseOptions(
    baseUrl: AppUrls.baseUrl,
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
  );

  static Dio get httpDio {
    if (_instance == null) {
      _instance = Dio(_options);

      _instance!.interceptors.add(_prettyDioLogger);

      return _instance!;
    } else {
      _instance!.interceptors.clear();
      _instance!.interceptors.add(_prettyDioLogger);

      return _instance!;
    }
  }

  ///returns a Dio client with Access token in header
  ///Also adds a token refresh interceptor which retry the request when it's unauthorized
  static Dio dioWithHeaderToken(token) {
    _addInterceptors(token);

    return _instance!;
  }

  static _addInterceptors(String token) {
    _instance ??= httpDio;
    _instance!.interceptors.clear();
    _instance!.interceptors.add(RequestHeaderInterceptor());
    _instance!.interceptors.add(_prettyDioLogger);
    var customHeaders = {'content-type': 'application/json'};
    if (token.trim().isNotEmpty) {
      customHeaders.addAll({'Authorization': 'Bearer $token'});
    }
    _instance?.options.headers = customHeaders;
  }

  static String _buildContentType(String version) {
    return "user_defined_content_type+$version";
  }

  DioProvider.setContentType(String version) {
    _instance?.options.contentType = _buildContentType(version);
  }

  DioProvider.setContentTypeApplicationJson() {
    _instance?.options.contentType = "application/json";
  }
}
