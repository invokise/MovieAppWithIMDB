import 'package:filmoteka/models/movies_model/movies_model.dart';
import 'package:filmoteka/resourses/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeAllMovieLoadedEvent>(_allMoviesLoadedEvent);
  }
  static final repository = Repository();

  _allMoviesLoadedEvent(
    HomeAllMovieLoadedEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeInitial());

    try {
      final topMovies = await repository.getTopRatedMovies();
      final popularMovies = await repository.getPopularMovies();

      emit(HomeAllMoviesLoadedState(
        popularMovies: popularMovies,
        topMovies: topMovies,
      ));
    } catch (error) {
      emit(HomeAllMoviesFailureState(error));
    }
  }
}
