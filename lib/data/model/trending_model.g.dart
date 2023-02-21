// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trending_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TrendingModel _$$_TrendingModelFromJson(Map<String, dynamic> json) =>
    _$_TrendingModel(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => ResultTrending.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['totalPages'] as int?,
      totalResults: json['totalResults'] as int?,
    );

Map<String, dynamic> _$$_TrendingModelToJson(_$_TrendingModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'totalPages': instance.totalPages,
      'totalResults': instance.totalResults,
    };

_$_ResultTrending _$$_ResultTrendingFromJson(Map<String, dynamic> json) =>
    _$_ResultTrending(
      adult: json['adult'] as bool?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      overview: json['overview'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      originalLanguage: json['original_language'] as String?,
      originalName: json['original_name'] as String?,
      posterPath: json['poster_path'] as String?,
      mediaType: $enumDecodeNullable(_$MediaTypeEnumMap, json['media_type']),
      genreIds:
          (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
      firstAirDate: json['first_air_date'] == null
          ? null
          : DateTime.parse(json['first_air_date'] as String),
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['vote_count'] as int?,
      originCountry: (json['origin_country'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      popularity: (json['popularity'] as num?)?.toDouble(),
      title: json['title'] as String?,
      originalTitle: json['originalTitle'] as String?,
      releaseDate: json['releaseDate'] == null
          ? null
          : DateTime.parse(json['releaseDate'] as String),
      video: json['video'] as bool?,
    );

Map<String, dynamic> _$$_ResultTrendingToJson(_$_ResultTrending instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'backdrop_path': instance.backdropPath,
      'original_language': instance.originalLanguage,
      'original_name': instance.originalName,
      'poster_path': instance.posterPath,
      'media_type': _$MediaTypeEnumMap[instance.mediaType],
      'genre_ids': instance.genreIds,
      'first_air_date': instance.firstAirDate?.toIso8601String(),
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'origin_country': instance.originCountry,
      'popularity': instance.popularity,
      'title': instance.title,
      'originalTitle': instance.originalTitle,
      'releaseDate': instance.releaseDate?.toIso8601String(),
      'video': instance.video,
    };

const _$MediaTypeEnumMap = {
  MediaType.tv: 'tv',
  MediaType.movie: 'movie',
};
