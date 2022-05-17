import 'package:filmoteka/models/movies_title_model/movies_title_model.dart';
import 'package:filmoteka/models/search_movie_model/results_model.dart';
import 'package:filmoteka/resourses/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_result_event.dart';
part 'search_result_state.dart';

class SearchResultBloc extends Bloc<SearchResultEvent, SearchResultState> {
  SearchResultBloc() : super(SearchResultInitial()) {
    on<SearchResultLoadedEvent>(_onSearchResultLoadedEvent);
  }
  static final _repository = Repository();

  _onSearchResultLoadedEvent(
    SearchResultLoadedEvent event,
    Emitter<SearchResultState> emit,
  ) async {
    emit(SearchResultInitial());
    try {
      final movie = await _repository.getMovieYouSearch(event.title);
      List<MoviesTitle> moviesTitle = [];

      for (int index = 0; index < movie.results!.length; index++) {
        if (movie.results?[index].id != null) {
          final movieTitle = await _repository
              .getMoviesTitle(movie.results![index].id.toString());
          moviesTitle.add(movieTitle);
        }
      }
      for (Results results in movie.results!) {
        if (results.id != null) {
          final movieTitle =
              await _repository.getMoviesTitle(results.id.toString());
          moviesTitle.add(movieTitle);
        }
      }

      emit(SearchResultSuccessState(movie: moviesTitle));
    } catch (error) {
      emit(SearchResultFailureState(error: error));
    }
  }
}
