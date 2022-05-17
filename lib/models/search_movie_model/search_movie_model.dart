import 'package:filmoteka/models/search_movie_model/results_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'search_movie_model.g.dart';

@JsonSerializable()
class SearchMovie {
  String? searchType;
  String? expression;
  List<Results>? results;
  String? errorMessage;

  SearchMovie({
    this.searchType,
    this.expression,
    this.results,
    this.errorMessage,
  });

  factory SearchMovie.fromJson(Map<String, dynamic> json) =>
      _$SearchMovieFromJson(json);

  Map<String, dynamic> toJson() => _$SearchMovieToJson(this);
}
