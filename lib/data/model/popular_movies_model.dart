// To parse this JSON data, do
//
//     final movieTopRated = movieTopRatedFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'popular_movies_model.freezed.dart';
part 'popular_movies_model.g.dart';

PopularMoviesModel popularMoviesModelFromJson(String str) => PopularMoviesModel.fromJson(json.decode(str));

String popularMoviesModelToJson(PopularMoviesModel data) => json.encode(data.toJson());

@freezed
class PopularMoviesModel with _$PopularMoviesModel {
  const factory PopularMoviesModel({
    int? page,
    List<Result>? results,
    int? totalPages,
    int? totalResults,
  }) = _MovieTopRated;

  factory PopularMoviesModel.fromJson(Map<String, dynamic> json) => _$PopularMoviesModelFromJson(json);
}

@freezed
class Result with _$Result {
  const factory Result({
    bool? adult,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'genre_ids')  List<int>? genreIds,
    @JsonKey(name: 'original_language')  String? originalLanguage,
    @JsonKey(name: 'original_title') String? originalTitle,
    @JsonKey(name: 'vote_average') double? voteAverage,
    @JsonKey(name: 'vote_count') int? voteCount,
    int? id,
    String? overview,
    double? popularity,
    String? posterPath,
    DateTime? releaseDate,
    String? title,
    bool? video,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}