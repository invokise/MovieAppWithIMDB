part of 'full_overview_movie_bloc.dart';

@immutable
abstract class FullOverviewMovieEvent {}

class FullOverviewMovieLoadedEvent extends FullOverviewMovieEvent {
  final String id;

  FullOverviewMovieLoadedEvent({required this.id});
}
