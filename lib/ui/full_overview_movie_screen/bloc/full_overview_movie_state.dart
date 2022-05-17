part of 'full_overview_movie_bloc.dart';

@immutable
abstract class FullOverviewMovieState {}

class FullOverviewMovieInitial extends FullOverviewMovieState {}

class FullOverviewMovieLoadedState extends FullOverviewMovieState {
  final MoviesTitle moviesTitle;

  FullOverviewMovieLoadedState({required this.moviesTitle});
}

class FullOverviewMovieFailureState extends FullOverviewMovieState {
  final dynamic error;

  FullOverviewMovieFailureState({required this.error});
}
