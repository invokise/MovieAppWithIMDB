import 'package:filmoteka/models/movies_title_model/movies_title_model.dart';
import 'package:filmoteka/resourses/repository.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'full_overview_movie_event.dart';
part 'full_overview_movie_state.dart';

class FullOverviewMovieBloc
    extends Bloc<FullOverviewMovieEvent, FullOverviewMovieState> {
  FullOverviewMovieBloc() : super(FullOverviewMovieInitial()) {
    on<FullOverviewMovieLoadedEvent>(_onFullOverviewMovieLoadedEvent);
  }

  final _repository = Repository();

  _onFullOverviewMovieLoadedEvent(FullOverviewMovieLoadedEvent event,
      Emitter<FullOverviewMovieState> emit) async {
    emit(FullOverviewMovieInitial());
    try {
      final moviesTitle = await _repository.getMoviesTitle(event.id);
      emit(FullOverviewMovieLoadedState(moviesTitle: moviesTitle));
    } catch (error) {
      emit(FullOverviewMovieFailureState(error: error));
    }
  }
}
