part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}


class FetchMoviesTopRated extends HomeEvent {}

class FetchMoviesPopular extends HomeEvent {}

class FetchMoviesUpComing extends HomeEvent {}

class FetchTrending extends HomeEvent {}

class FetchMovieDetail extends HomeEvent {
  final String? movieId;
  FetchMovieDetail({this.movieId});
}
class FetchCastCrew extends HomeEvent {
  final String? movieId;
  FetchCastCrew({this.movieId});
}