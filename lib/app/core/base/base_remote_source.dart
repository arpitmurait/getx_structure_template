import 'dart:isolate';

import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:logger/logger.dart';

import '../values/app_values.dart';
import '/app/network/dio_provider.dart';
import '/app/network/error_handlers.dart';
import '/app/network/exceptions/base_exception.dart';
import '/flavors/build_config.dart';

abstract class BaseRemoteSource {
  Dio get dioClient => DioProvider.dioWithHeaderToken;


  Future<Map<String, dynamic>> callApiWithErrorParser(Future<Response> api) async {
    ReceivePort receivePort = ReceivePort();
    var a = await api;
    await Isolate.spawn(fetchDataIsolate, IsolateData(receivePort.sendPort,a ));
    print("receivePort $receivePort");
    var res = await receivePort.first as Map;
    print("ressss $res");
    return res['data'] as Map<String, dynamic>;
  }

}


void fetchDataIsolate<T>(IsolateData sendPort) {

  try {
    Response response = sendPort.api;

    if (response.statusCode != HttpStatus.ok ||
        (response.data as Map<String, dynamic>)['statusCode'] !=
            HttpStatus.ok) {
      // TODO
    }
    sendPort.sendPort.send({'success' : true, 'data' : response.data as Map<String, dynamic>});
  } on DioException catch (dioError) {
    Exception exception = handleDioError(dioError);
    print("error $exception");
    throw exception;
  } catch (error) {
    print("error $error");

    if (error is BaseException) {
      rethrow;
    }

    throw handleError("$error");
  }
}

class IsolateData {
  final SendPort sendPort;
  final Response api;

  IsolateData(this.sendPort, this.api,);
}