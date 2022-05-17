import 'dart:convert';
import 'package:filmoteka/models/movies_model/movies_model.dart';
import 'package:filmoteka/models/movies_title_model/movies_title_model.dart';
import 'package:filmoteka/models/search_movie_model/search_movie_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class MovieApiProvider {
  final _baseUrl = "https://imdb-api.com/en/API";

  Future<Movies> getTopMovies() async {
    final response = await http.get(Uri.parse(
      "$_baseUrl/Top250Movies/${dotenv.env['API_KEY']}",
    ));

    if (response.statusCode == 200) {
      return Movies.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed!');
    }
  }

  Future<Movies> getPopularMovies() async {
    final response = await http.get(Uri.parse(
      "$_baseUrl/MostPopularMovies/${dotenv.env['API_KEY']}",
    ));

    if (response.statusCode == 200) {
      return Movies.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed!');
    }
  }

  Future<SearchMovie> getMovieYouSearch(String title) async {
    final response = await http.get(Uri.parse(
      "$_baseUrl/SearchMovie/${dotenv.env['API_KEY']}/$title",
    ));

    if (response.statusCode == 200) {
      return SearchMovie.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed!');
    }
  }

  Future<MoviesTitle> getMoviesTitle(String id) async {
    final response = await http.get(Uri.parse(
      "$_baseUrl/Title/${dotenv.env['API_KEY']}/$id",
    ));

    if (response.statusCode == 200) {
      return MoviesTitle.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed!');
    }
  }
}
