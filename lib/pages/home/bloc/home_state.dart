part of 'home_bloc.dart';

class HomeState {
  final MovieTopRated? movieTopRated;
  final PopularMoviesModel? popularMovies;
  final MoviesUpComingModel? moviesUpComing;
  final MovieDetailModel? moviesDetail;
  final CastCrewModel? castCrewModel;

  HomeState({
    this.movieTopRated,
    this.popularMovies,
    this.moviesUpComing,
    this.moviesDetail,
    this.castCrewModel,
  });

  HomeState copyWith({
    MovieTopRated? movieTopRated,
    PopularMoviesModel? popularMovies,
    MoviesUpComingModel? moviesUpComing,
    MovieDetailModel? moviesDetail,
    CastCrewModel? castCrewModel,
  }) {
    return HomeState(
      movieTopRated: movieTopRated ?? this.movieTopRated,
      popularMovies: popularMovies ?? this.popularMovies,
      moviesUpComing: moviesUpComing ?? this.moviesUpComing,
      moviesDetail: moviesDetail ?? this.moviesDetail,
      castCrewModel: castCrewModel ?? this.castCrewModel,
    );
  }
}
