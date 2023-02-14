import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../app/constant.dart';

class HttpServices {
  static final HttpServices _instance = HttpServices._internal();

  factory HttpServices() => _instance;

  HttpServices._internal();

  Dio? _dio;

  final int _timeout = 60 * 100;

  Map<String, String> headers = {
    'content-type': 'application/json',
    'accept': 'application/json',
    'language': 'en'
  };

  Dio getDioInstance() {
    _dio ??= Dio(BaseOptions(
        baseUrl: Constant.baseUrl,
        connectTimeout: _timeout,
        receiveTimeout: _timeout,
        headers: headers));

    _dio!.interceptors.add(PrettyDioLogger(
        requestHeader: true, requestBody: true, responseHeader: true));
    return _dio!;
  }
}
