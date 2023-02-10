// To parse this JSON data, do
//
//     final movieTopRated = movieTopRatedFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'top_rated_movie.freezed.dart';
part 'top_rated_movie.g.dart';

MovieTopRated movieTopRatedFromJson(String str) => MovieTopRated.fromJson(json.decode(str));

String movieTopRatedToJson(MovieTopRated data) => json.encode(data.toJson());

@freezed
class MovieTopRated with _$MovieTopRated {
  const factory MovieTopRated({
    int? page,
    List<Result>? results,
    int? totalPages,
    int? totalResults,
  }) = _MovieTopRated;

  factory MovieTopRated.fromJson(Map<String, dynamic> json) => _$MovieTopRatedFromJson(json);
}

@freezed
class Result with _$Result {
  const factory Result({
    bool? adult,
    String? backdropPath,
    List<int>? genreIds,
    int? id,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    DateTime? releaseDate,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}