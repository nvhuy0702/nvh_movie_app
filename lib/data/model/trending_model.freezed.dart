// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trending_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TrendingModel _$TrendingModelFromJson(Map<String, dynamic> json) {
  return _TrendingModel.fromJson(json);
}

/// @nodoc
mixin _$TrendingModel {
  int? get page => throw _privateConstructorUsedError;
  List<ResultTrending>? get results => throw _privateConstructorUsedError;
  int? get totalPages => throw _privateConstructorUsedError;
  int? get totalResults => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrendingModelCopyWith<TrendingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrendingModelCopyWith<$Res> {
  factory $TrendingModelCopyWith(
          TrendingModel value, $Res Function(TrendingModel) then) =
      _$TrendingModelCopyWithImpl<$Res, TrendingModel>;
  @useResult
  $Res call(
      {int? page,
      List<ResultTrending>? results,
      int? totalPages,
      int? totalResults});
}

/// @nodoc
class _$TrendingModelCopyWithImpl<$Res, $Val extends TrendingModel>
    implements $TrendingModelCopyWith<$Res> {
  _$TrendingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? results = freezed,
    Object? totalPages = freezed,
    Object? totalResults = freezed,
  }) {
    return _then(_value.copyWith(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      results: freezed == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<ResultTrending>?,
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      totalResults: freezed == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TrendingModelCopyWith<$Res>
    implements $TrendingModelCopyWith<$Res> {
  factory _$$_TrendingModelCopyWith(
          _$_TrendingModel value, $Res Function(_$_TrendingModel) then) =
      __$$_TrendingModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? page,
      List<ResultTrending>? results,
      int? totalPages,
      int? totalResults});
}

/// @nodoc
class __$$_TrendingModelCopyWithImpl<$Res>
    extends _$TrendingModelCopyWithImpl<$Res, _$_TrendingModel>
    implements _$$_TrendingModelCopyWith<$Res> {
  __$$_TrendingModelCopyWithImpl(
      _$_TrendingModel _value, $Res Function(_$_TrendingModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? results = freezed,
    Object? totalPages = freezed,
    Object? totalResults = freezed,
  }) {
    return _then(_$_TrendingModel(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      results: freezed == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<ResultTrending>?,
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      totalResults: freezed == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TrendingModel implements _TrendingModel {
  const _$_TrendingModel(
      {this.page,
      final List<ResultTrending>? results,
      this.totalPages,
      this.totalResults})
      : _results = results;

  factory _$_TrendingModel.fromJson(Map<String, dynamic> json) =>
      _$$_TrendingModelFromJson(json);

  @override
  final int? page;
  final List<ResultTrending>? _results;
  @override
  List<ResultTrending>? get results {
    final value = _results;
    if (value == null) return null;
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? totalPages;
  @override
  final int? totalResults;

  @override
  String toString() {
    return 'TrendingModel(page: $page, results: $results, totalPages: $totalPages, totalResults: $totalResults)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TrendingModel &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalResults, totalResults) ||
                other.totalResults == totalResults));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, page,
      const DeepCollectionEquality().hash(_results), totalPages, totalResults);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TrendingModelCopyWith<_$_TrendingModel> get copyWith =>
      __$$_TrendingModelCopyWithImpl<_$_TrendingModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TrendingModelToJson(
      this,
    );
  }
}

abstract class _TrendingModel implements TrendingModel {
  const factory _TrendingModel(
      {final int? page,
      final List<ResultTrending>? results,
      final int? totalPages,
      final int? totalResults}) = _$_TrendingModel;

  factory _TrendingModel.fromJson(Map<String, dynamic> json) =
      _$_TrendingModel.fromJson;

  @override
  int? get page;
  @override
  List<ResultTrending>? get results;
  @override
  int? get totalPages;
  @override
  int? get totalResults;
  @override
  @JsonKey(ignore: true)
  _$$_TrendingModelCopyWith<_$_TrendingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

ResultTrending _$ResultTrendingFromJson(Map<String, dynamic> json) {
  return _ResultTrending.fromJson(json);
}

/// @nodoc
mixin _$ResultTrending {
  bool? get adult => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get overview => throw _privateConstructorUsedError;
  @JsonKey(name: 'backdrop_path')
  String? get backdropPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_language')
  String? get originalLanguage => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_name')
  String? get originalName => throw _privateConstructorUsedError;
  @JsonKey(name: 'poster_path')
  String? get posterPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'media_type')
  MediaType? get mediaType => throw _privateConstructorUsedError;
  @JsonKey(name: 'genre_ids')
  List<int>? get genreIds => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_air_date')
  DateTime? get firstAirDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'vote_average')
  double? get voteAverage => throw _privateConstructorUsedError;
  @JsonKey(name: 'vote_count')
  int? get voteCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'origin_country')
  List<String>? get originCountry => throw _privateConstructorUsedError;
  double? get popularity => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get originalTitle => throw _privateConstructorUsedError;
  DateTime? get releaseDate => throw _privateConstructorUsedError;
  bool? get video => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResultTrendingCopyWith<ResultTrending> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultTrendingCopyWith<$Res> {
  factory $ResultTrendingCopyWith(
          ResultTrending value, $Res Function(ResultTrending) then) =
      _$ResultTrendingCopyWithImpl<$Res, ResultTrending>;
  @useResult
  $Res call(
      {bool? adult,
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
      bool? video});
}

/// @nodoc
class _$ResultTrendingCopyWithImpl<$Res, $Val extends ResultTrending>
    implements $ResultTrendingCopyWith<$Res> {
  _$ResultTrendingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adult = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? overview = freezed,
    Object? backdropPath = freezed,
    Object? originalLanguage = freezed,
    Object? originalName = freezed,
    Object? posterPath = freezed,
    Object? mediaType = freezed,
    Object? genreIds = freezed,
    Object? firstAirDate = freezed,
    Object? voteAverage = freezed,
    Object? voteCount = freezed,
    Object? originCountry = freezed,
    Object? popularity = freezed,
    Object? title = freezed,
    Object? originalTitle = freezed,
    Object? releaseDate = freezed,
    Object? video = freezed,
  }) {
    return _then(_value.copyWith(
      adult: freezed == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      backdropPath: freezed == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      originalLanguage: freezed == originalLanguage
          ? _value.originalLanguage
          : originalLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
      originalName: freezed == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String?,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaType: freezed == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as MediaType?,
      genreIds: freezed == genreIds
          ? _value.genreIds
          : genreIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      firstAirDate: freezed == firstAirDate
          ? _value.firstAirDate
          : firstAirDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      voteAverage: freezed == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double?,
      voteCount: freezed == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int?,
      originCountry: freezed == originCountry
          ? _value.originCountry
          : originCountry // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      popularity: freezed == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      originalTitle: freezed == originalTitle
          ? _value.originalTitle
          : originalTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      video: freezed == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResultTrendingCopyWith<$Res>
    implements $ResultTrendingCopyWith<$Res> {
  factory _$$_ResultTrendingCopyWith(
          _$_ResultTrending value, $Res Function(_$_ResultTrending) then) =
      __$$_ResultTrendingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? adult,
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
      bool? video});
}

/// @nodoc
class __$$_ResultTrendingCopyWithImpl<$Res>
    extends _$ResultTrendingCopyWithImpl<$Res, _$_ResultTrending>
    implements _$$_ResultTrendingCopyWith<$Res> {
  __$$_ResultTrendingCopyWithImpl(
      _$_ResultTrending _value, $Res Function(_$_ResultTrending) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adult = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? overview = freezed,
    Object? backdropPath = freezed,
    Object? originalLanguage = freezed,
    Object? originalName = freezed,
    Object? posterPath = freezed,
    Object? mediaType = freezed,
    Object? genreIds = freezed,
    Object? firstAirDate = freezed,
    Object? voteAverage = freezed,
    Object? voteCount = freezed,
    Object? originCountry = freezed,
    Object? popularity = freezed,
    Object? title = freezed,
    Object? originalTitle = freezed,
    Object? releaseDate = freezed,
    Object? video = freezed,
  }) {
    return _then(_$_ResultTrending(
      adult: freezed == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      overview: freezed == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      backdropPath: freezed == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      originalLanguage: freezed == originalLanguage
          ? _value.originalLanguage
          : originalLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
      originalName: freezed == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String?,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaType: freezed == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as MediaType?,
      genreIds: freezed == genreIds
          ? _value._genreIds
          : genreIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      firstAirDate: freezed == firstAirDate
          ? _value.firstAirDate
          : firstAirDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      voteAverage: freezed == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double?,
      voteCount: freezed == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int?,
      originCountry: freezed == originCountry
          ? _value._originCountry
          : originCountry // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      popularity: freezed == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      originalTitle: freezed == originalTitle
          ? _value.originalTitle
          : originalTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      video: freezed == video
          ? _value.video
          : video // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResultTrending implements _ResultTrending {
  const _$_ResultTrending(
      {this.adult,
      this.id,
      this.name,
      this.overview,
      @JsonKey(name: 'backdrop_path') this.backdropPath,
      @JsonKey(name: 'original_language') this.originalLanguage,
      @JsonKey(name: 'original_name') this.originalName,
      @JsonKey(name: 'poster_path') this.posterPath,
      @JsonKey(name: 'media_type') this.mediaType,
      @JsonKey(name: 'genre_ids') final List<int>? genreIds,
      @JsonKey(name: 'first_air_date') this.firstAirDate,
      @JsonKey(name: 'vote_average') this.voteAverage,
      @JsonKey(name: 'vote_count') this.voteCount,
      @JsonKey(name: 'origin_country') final List<String>? originCountry,
      this.popularity,
      this.title,
      this.originalTitle,
      this.releaseDate,
      this.video})
      : _genreIds = genreIds,
        _originCountry = originCountry;

  factory _$_ResultTrending.fromJson(Map<String, dynamic> json) =>
      _$$_ResultTrendingFromJson(json);

  @override
  final bool? adult;
  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? overview;
  @override
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  @override
  @JsonKey(name: 'original_language')
  final String? originalLanguage;
  @override
  @JsonKey(name: 'original_name')
  final String? originalName;
  @override
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @override
  @JsonKey(name: 'media_type')
  final MediaType? mediaType;
  final List<int>? _genreIds;
  @override
  @JsonKey(name: 'genre_ids')
  List<int>? get genreIds {
    final value = _genreIds;
    if (value == null) return null;
    if (_genreIds is EqualUnmodifiableListView) return _genreIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'first_air_date')
  final DateTime? firstAirDate;
  @override
  @JsonKey(name: 'vote_average')
  final double? voteAverage;
  @override
  @JsonKey(name: 'vote_count')
  final int? voteCount;
  final List<String>? _originCountry;
  @override
  @JsonKey(name: 'origin_country')
  List<String>? get originCountry {
    final value = _originCountry;
    if (value == null) return null;
    if (_originCountry is EqualUnmodifiableListView) return _originCountry;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final double? popularity;
  @override
  final String? title;
  @override
  final String? originalTitle;
  @override
  final DateTime? releaseDate;
  @override
  final bool? video;

  @override
  String toString() {
    return 'ResultTrending(adult: $adult, id: $id, name: $name, overview: $overview, backdropPath: $backdropPath, originalLanguage: $originalLanguage, originalName: $originalName, posterPath: $posterPath, mediaType: $mediaType, genreIds: $genreIds, firstAirDate: $firstAirDate, voteAverage: $voteAverage, voteCount: $voteCount, originCountry: $originCountry, popularity: $popularity, title: $title, originalTitle: $originalTitle, releaseDate: $releaseDate, video: $video)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResultTrending &&
            (identical(other.adult, adult) || other.adult == adult) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.backdropPath, backdropPath) ||
                other.backdropPath == backdropPath) &&
            (identical(other.originalLanguage, originalLanguage) ||
                other.originalLanguage == originalLanguage) &&
            (identical(other.originalName, originalName) ||
                other.originalName == originalName) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            const DeepCollectionEquality().equals(other._genreIds, _genreIds) &&
            (identical(other.firstAirDate, firstAirDate) ||
                other.firstAirDate == firstAirDate) &&
            (identical(other.voteAverage, voteAverage) ||
                other.voteAverage == voteAverage) &&
            (identical(other.voteCount, voteCount) ||
                other.voteCount == voteCount) &&
            const DeepCollectionEquality()
                .equals(other._originCountry, _originCountry) &&
            (identical(other.popularity, popularity) ||
                other.popularity == popularity) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.originalTitle, originalTitle) ||
                other.originalTitle == originalTitle) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.video, video) || other.video == video));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        adult,
        id,
        name,
        overview,
        backdropPath,
        originalLanguage,
        originalName,
        posterPath,
        mediaType,
        const DeepCollectionEquality().hash(_genreIds),
        firstAirDate,
        voteAverage,
        voteCount,
        const DeepCollectionEquality().hash(_originCountry),
        popularity,
        title,
        originalTitle,
        releaseDate,
        video
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResultTrendingCopyWith<_$_ResultTrending> get copyWith =>
      __$$_ResultTrendingCopyWithImpl<_$_ResultTrending>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResultTrendingToJson(
      this,
    );
  }
}

abstract class _ResultTrending implements ResultTrending {
  const factory _ResultTrending(
      {final bool? adult,
      final int? id,
      final String? name,
      final String? overview,
      @JsonKey(name: 'backdrop_path') final String? backdropPath,
      @JsonKey(name: 'original_language') final String? originalLanguage,
      @JsonKey(name: 'original_name') final String? originalName,
      @JsonKey(name: 'poster_path') final String? posterPath,
      @JsonKey(name: 'media_type') final MediaType? mediaType,
      @JsonKey(name: 'genre_ids') final List<int>? genreIds,
      @JsonKey(name: 'first_air_date') final DateTime? firstAirDate,
      @JsonKey(name: 'vote_average') final double? voteAverage,
      @JsonKey(name: 'vote_count') final int? voteCount,
      @JsonKey(name: 'origin_country') final List<String>? originCountry,
      final double? popularity,
      final String? title,
      final String? originalTitle,
      final DateTime? releaseDate,
      final bool? video}) = _$_ResultTrending;

  factory _ResultTrending.fromJson(Map<String, dynamic> json) =
      _$_ResultTrending.fromJson;

  @override
  bool? get adult;
  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get overview;
  @override
  @JsonKey(name: 'backdrop_path')
  String? get backdropPath;
  @override
  @JsonKey(name: 'original_language')
  String? get originalLanguage;
  @override
  @JsonKey(name: 'original_name')
  String? get originalName;
  @override
  @JsonKey(name: 'poster_path')
  String? get posterPath;
  @override
  @JsonKey(name: 'media_type')
  MediaType? get mediaType;
  @override
  @JsonKey(name: 'genre_ids')
  List<int>? get genreIds;
  @override
  @JsonKey(name: 'first_air_date')
  DateTime? get firstAirDate;
  @override
  @JsonKey(name: 'vote_average')
  double? get voteAverage;
  @override
  @JsonKey(name: 'vote_count')
  int? get voteCount;
  @override
  @JsonKey(name: 'origin_country')
  List<String>? get originCountry;
  @override
  double? get popularity;
  @override
  String? get title;
  @override
  String? get originalTitle;
  @override
  DateTime? get releaseDate;
  @override
  bool? get video;
  @override
  @JsonKey(ignore: true)
  _$$_ResultTrendingCopyWith<_$_ResultTrending> get copyWith =>
      throw _privateConstructorUsedError;
}
