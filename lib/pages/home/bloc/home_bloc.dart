import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/detail_movies_model.dart';
import '../../../data/model/popular_movies_model.dart';
import '../../../data/model/top_rated_movie.dart';
import '../../../data/model/upcoming_movies_model.dart';
import '../../../data/repository/movies_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final MoviesRepository moviesRepository;

  HomeBloc(this.moviesRepository) : super(HomeState()) {
    on<FetchMoviesTopRated>(_fetchMoviesTopRated);
    on<FetchMoviesPopular>(_fetchMoviesPopular);
    on<FetchMoviesUpComing>(_fetchMoviesUpcoming);
    on<FetchMovieDetail>(_fetchMoviesDetail);
  }

  FutureOr<void> _fetchMoviesTopRated(FetchMoviesTopRated event, Emitter<HomeState> emit) async {
    final responseMoviesTopRated = await moviesRepository.getMoviesTopRated();
    emit(state.copyWith(movieTopRated: responseMoviesTopRated));
  }

  FutureOr<void> _fetchMoviesPopular(FetchMoviesPopular event, Emitter<HomeState> emit) async {
    final responseMoviesPopular = await moviesRepository.getMoviesPopular();
    emit(state.copyWith(popularMovies: responseMoviesPopular));
  }

  FutureOr<void> _fetchMoviesUpcoming(FetchMoviesUpComing event, Emitter<HomeState> emit) async {
    final responseMoviesUpComing = await moviesRepository.getMoviesUpComing();
    emit(state.copyWith(moviesUpComing: responseMoviesUpComing));
  }

  FutureOr<void> _fetchMoviesDetail(FetchMovieDetail event, Emitter<HomeState> emit) async {
    final responseMoviesDetail = await moviesRepository.getMoviesDetail(movieId: event.movieId);
    print('hahahaha ---> $responseMoviesDetail');
    emit(state.copyWith(moviesDetail: responseMoviesDetail));
  }
}
