part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeAllMoviesLoadedState extends HomeState {
  final Movies topMovies;
  final Movies popularMovies;

  HomeAllMoviesLoadedState({
    required this.topMovies,
    required this.popularMovies,
  });
}

class HomeAllMoviesFailureState extends HomeState {
  final dynamic error;

  HomeAllMoviesFailureState(this.error);
}
