// To parse this JSON data, do
//
//     final moviesUpComing = moviesUpComingFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'upcoming_movies_model.freezed.dart';
part 'upcoming_movies_model.g.dart';

MoviesUpComingModel moviesUpComingFromJson(String str) => MoviesUpComingModel.fromJson(json.decode(str));

String moviesUpComingToJson(MoviesUpComingModel data) => json.encode(data.toJson());

@freezed
class MoviesUpComingModel with _$MoviesUpComingModel {
  const factory MoviesUpComingModel({
    Dates? dates,
    int? page,
    List<Result>? results,
    int? totalPages,
    int? totalResults,
  }) = _MoviesUpComingModel;

  factory MoviesUpComingModel.fromJson(Map<String, dynamic> json) => _$MoviesUpComingModelFromJson(json);
}

@freezed
class Dates with _$Dates {
  const factory Dates({
    DateTime? maximum,
    DateTime? minimum,
  }) = _Dates;

  factory Dates.fromJson(Map<String, dynamic> json) => _$DatesFromJson(json);
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
