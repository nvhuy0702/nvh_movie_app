import 'package:dio/dio.dart';

import '../../config/api_movie.dart';

class TopRatedService {
  Future getData() async {
    try {
      final response =
      await Dio().get(ApiMovie.topRated);
      return response.data;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
}