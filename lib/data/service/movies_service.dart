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

  Future getTrending() async {
    try {
      final response =
      await Dio().get(ApiMovie.trending);
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
  Future getMovieDetails({String? movieId}) async {
    try {
      final response =
      await Dio().get("https://api.themoviedb.org/3/movie/$movieId?api_key=b885224e32ae22bdc4af7c0177ae0eb7&language=en-US");
      return response.data;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
  Future getCastCrew({String? movieId}) async {
    try {
      final response =
      await Dio().get("https://api.themoviedb.org/3/movie/$movieId/credits?api_key=b885224e32ae22bdc4af7c0177ae0eb7&language=en-US&page=1");
      return response.data;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

}