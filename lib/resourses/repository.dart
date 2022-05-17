import 'dart:convert';

import 'package:filmoteka/models/movies_model/movies_model.dart';
import 'package:filmoteka/models/movies_title_model/movies_title_model.dart';
import 'package:filmoteka/models/search_movie_model/search_movie_model.dart';

import 'package:filmoteka/services/cache_service.dart';

import 'movie_api_provider.dart';

class Repository {
  static final movieApiProvider = MovieApiProvider();
  final cacheService = CacheService();

  Future<Movies> getPopularMovies() async {
    if (CacheService.haveNotData()) {
      final response = await movieApiProvider.getPopularMovies();
      final movie = jsonEncode(response);
      cacheService.saveMovies(movie);

      return response;
    } else {
      return CacheService().getMovies();
    }
  }

  Future<Movies> getTopRatedMovies() async {
    return await movieApiProvider.getTopMovies();
  }

  Future<SearchMovie> getMovieYouSearch(String title) async {
    return await movieApiProvider.getMovieYouSearch(title);
  }

  Future<MoviesTitle> getMoviesTitle(String id) async {
    return await movieApiProvider.getMoviesTitle(id);
  }
}
