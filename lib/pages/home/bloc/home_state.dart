part of 'home_bloc.dart';

class HomeState {
  final MovieTopRated? movieTopRated;
  final PopularMoviesModel? popularMovies;
  final MoviesUpComingModel? moviesUpComing;

  HomeState({
    this.movieTopRated,
    this.popularMovies,
    this.moviesUpComing,
  });

  HomeState copyWith({
    MovieTopRated? movieTopRated,
    PopularMoviesModel? popularMovies,
    MoviesUpComingModel? moviesUpComing,
  }) {
    return HomeState(
      movieTopRated: movieTopRated ?? this.movieTopRated,
      popularMovies: popularMovies ?? this.popularMovies,
      moviesUpComing: moviesUpComing ?? this.moviesUpComing,
    );
  }
}
