// To parse this JSON data, do
//
//     final trendingModel = trendingModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'trending_model.freezed.dart';
part 'trending_model.g.dart';

TrendingModel trendingModelFromJson(String str) => TrendingModel.fromJson(json.decode(str));

String trendingModelToJson(TrendingModel data) => json.encode(data.toJson());

@freezed
class TrendingModel with _$TrendingModel {
  const factory TrendingModel({
    int? page,
    List<ResultTrending>? results,
    int? totalPages,
    int? totalResults,
  }) = _TrendingModel;

  factory TrendingModel.fromJson(Map<String, dynamic> json) => _$TrendingModelFromJson(json);
}

@freezed
class ResultTrending with _$ResultTrending {
  const factory ResultTrending({
    bool? adult,
    int? id,
    String? name,
    String? overview,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'original_language') String? originalLanguage,
    @JsonKey(name: 'original_name') String? originalName,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'media_type') MediaType? mediaType,
    @JsonKey(name: 'genre_ids') List<int>? genreIds,
    @JsonKey(name: 'first_air_date') DateTime? firstAirDate,
    @JsonKey(name: 'vote_average') double? voteAverage,
    @JsonKey(name: 'vote_count') int? voteCount,
    @JsonKey(name: 'origin_country') List<String>? originCountry,
    double? popularity,
    String? title,
    String? originalTitle,
    DateTime? releaseDate,
    bool? video,
  }) = _ResultTrending;

  factory ResultTrending.fromJson(Map<String, dynamic> json) => _$ResultTrendingFromJson(json);
}

enum MediaType { tv, movie }

final mediaTypeValues = EnumValues({
  "movie": MediaType.movie,
  "tv": MediaType.tv
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
