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
    @JsonKey(name: 'release_date') DateTime? releaseDate,
    String? title,
    bool? video,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}