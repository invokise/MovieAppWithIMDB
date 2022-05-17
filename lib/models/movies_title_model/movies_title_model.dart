import 'package:json_annotation/json_annotation.dart';
part 'movies_title_model.g.dart';

@JsonSerializable()
class MoviesTitle {
  String? id;
  String? title;
  String? originalTitle;
  String? fullTitle;
  String? type;
  String? year;
  String? image;
  String? releaseDate;
  String? runtimeMins;
  String? runtimeStr;
  String? plot;
  String? plotLocal;
  bool? plotLocalIsRtl;
  String? awards;
  String? directors;
  String? writers;
  String? stars;
  String? genres;
  String? companies;
  String? countries;
  String? languages;
  String? contentRating;
  String? imDbRating;
  String? imDbRatingVotes;
  String? metacriticRating;
  String? tagline;
  String? keywords;
  List<String>? keywordList;

  MoviesTitle({
    this.id,
    this.title,
    this.originalTitle,
    this.fullTitle,
    this.type,
    this.year,
    this.image,
    this.releaseDate,
    this.runtimeMins,
    this.runtimeStr,
    this.plot,
    this.plotLocal,
    this.plotLocalIsRtl,
    this.awards,
    this.directors,
    this.writers,
    this.stars,
    this.genres,
    this.companies,
    this.countries,
    this.languages,
    this.contentRating,
    this.imDbRating,
    this.imDbRatingVotes,
    this.metacriticRating,
    this.tagline,
    this.keywords,
    this.keywordList,
  });

  factory MoviesTitle.fromJson(Map<String, dynamic> json) =>
      _$MoviesTitleFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesTitleToJson(this);
}
