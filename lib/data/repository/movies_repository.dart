
import 'dart:async';

import 'package:nvh_movie_app/data/model/cast_crew_model.dart';

import '../model/detail_movies_model.dart';
import '../model/popular_movies_model.dart';
import '../model/top_rated_movie.dart';
import '../model/upcoming_movies_model.dart';
import '../service/movies_service.dart';

class MoviesRepository {
  FutureOr<MovieTopRated> getMoviesTopRated() async {
    try {
      final result = await MoviesService().getMovieTopRated();
      return MovieTopRated.fromJson(result);
    } catch (e) {
      throw Exception(e);
    }
  }

  FutureOr<PopularMoviesModel> getMoviesPopular() async {
    try {
      final result = await MoviesService().getMoviePopular();
      return PopularMoviesModel.fromJson(result);
    } catch (e) {
      throw Exception(e);
    }
  }

  FutureOr<MoviesUpComingModel> getMoviesUpComing() async {
    try {
      final result = await MoviesService().getMovieUpComing();
      return MoviesUpComingModel.fromJson(result);
    } catch (e) {
      throw Exception(e);
    }
  }

  FutureOr<MovieDetailModel> getMoviesDetail({String? movieId}) async {
    try {
      final result = await MoviesService().getMovieDetails(movieId: movieId);
      return MovieDetailModel.fromJson(result);
    } catch (e) {
      throw Exception(e);
    }
  }
  FutureOr<CastCrewModel> getCastCrew({String? movieId}) async {
    try {
      final result = await MoviesService().getCastCrew(movieId: movieId);
      print("result $result");
      return CastCrewModel.fromJson(result);
    } catch (e) {
      throw Exception(e);
    }
  }
}