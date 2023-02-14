// To parse this JSON data, do
//
//     final movieDetailModel = movieDetailModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'detail_movies_model.freezed.dart';

part 'detail_movies_model.g.dart';

MovieDetailModel movieDetailModelFromJson(String str) =>
    MovieDetailModel.fromJson(json.decode(str));

String movieDetailModelToJson(MovieDetailModel data) =>
    json.encode(data.toJson());

@freezed
class MovieDetailModel with _$MovieDetailModel {
  const factory MovieDetailModel({
    bool? adult,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    dynamic belongsToCollection,
    int? budget,
    List<Genre>? genres,
    String? homepage,
    int? id,
    @JsonKey(name: 'imdb_id') String? imdbId,
    @JsonKey(name: 'original_language') String? originalLanguage,
    @JsonKey(name: 'original_title') String? originalTitle,
    @JsonKey(name: 'poster_path') String? posterPath,
    String? overview,
    double? popularity,
    @JsonKey(name: 'production_companies')
        List<ProductionCompany>? productionCompanies,
    @JsonKey(name: 'production_countries') List<dynamic>? productionCountries,
    @JsonKey(name: 'release_date') DateTime? releaseDate,
    @JsonKey(name: 'spoken_languages') List<SpokenLanguage>? spokenLanguages,
    @JsonKey(name: 'vote_average') double? voteAverage,
    @JsonKey(name: 'vote_count') int? voteCount,
    int? revenue,
    int? runtime,
    String? status,
    String? tagline,
    String? title,
    bool? video,
  }) = _MovieDetailModel;

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailModelFromJson(json);
}

@freezed
class Genre with _$Genre {
  const factory Genre({
    int? id,
    String? name,
  }) = _Genre;

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}

@freezed
class ProductionCompany with _$ProductionCompany {
  const factory ProductionCompany({
    int? id,
    @JsonKey(name: 'logo_path') String? logoPath,
    @JsonKey(name: 'origin_country') String? originCountry,
    String? name,
  }) = _ProductionCompany;

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyFromJson(json);
}

@freezed
class SpokenLanguage with _$SpokenLanguage {
  const factory SpokenLanguage({
    @JsonKey(name: 'english_name') String? englishName,
    @JsonKey(name: 'iso_639_1') String? iso6391,
    String? name,
  }) = _SpokenLanguage;

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageFromJson(json);
}
