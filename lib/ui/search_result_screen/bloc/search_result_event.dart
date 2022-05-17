part of 'search_result_bloc.dart';

@immutable
abstract class SearchResultEvent {}

class SearchResultLoadedEvent extends SearchResultEvent {
  final String title;

  SearchResultLoadedEvent({required this.title});
}
