import 'dart:convert';
import 'package:filmoteka/models/movies_model/movies_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheService {
  static const key = 'popular_movies';
  static late SharedPreferences preference;

  static Future<void> initPreference() async {
    preference = await SharedPreferences.getInstance();
  }

  static bool haveNotData() {
    try {
      return preference.getString(key)!.isEmpty;
    } catch (e) {
      return true;
    }
  }

  Future<void> saveMovies(String movie) async {
    await preference.setString(key, movie);
  }

  Future<Movies> getMovies() async {
    final result = preference.getString(key) ?? '';

    return Movies.fromJson(jsonDecode(result));
  }
}
