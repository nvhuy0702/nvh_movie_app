import 'package:dio/dio.dart';

import '../../config/api_movie.dart';

class MoviesService {
  Future getMovieTopRated() async {
    try {
      final response =
      await Dio().get(ApiMovie.topRated);
      return response.data;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future getMoviePopular() async {
    try {
      final response =
      await Dio().get(ApiMovie.popular);
      return response.data;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future getMovieUpComing() async {
    try {
      final response =
      await Dio().get(ApiMovie.upcoming);
      return response.data;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

}