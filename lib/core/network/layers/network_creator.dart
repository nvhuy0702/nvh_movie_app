import 'dart:io';
import 'package:dio/dio.dart';
import 'package:nvh_movie_app/core/network/network_option/network_option.dart';

import '../interfaces/base_client_generator.dart';

class NetworkCreator {
  static var shared = NetworkCreator();
  final Dio _client = Dio();

  Future<Response> request(
      {required BaseClientGenerator route, NetworkOptions? options}) {
    return _client.fetch(RequestOptions(
        baseUrl: route.baseURL,
        method: route.method,
        path: route.path,
        queryParameters: route.queryParameters,
        data: route.body,
        sendTimeout: route.sendTimeout,
        receiveTimeout: route.sendTimeout,
        onReceiveProgress: options?.onReceiveProgress,
        validateStatus: (statusCode) => (statusCode! >= HttpStatus.ok &&
            statusCode <= HttpStatus.multipleChoices)));
  }
}
