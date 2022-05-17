import 'package:filmoteka/models/movies_model/items_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'movies_model.g.dart';

@JsonSerializable()
class Movies {
  List<Items>? items;
  String? errorMessage;

  Movies({
    this.items,
    this.errorMessage,
  });

  factory Movies.fromJson(Map<String, dynamic> json) => _$MoviesFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesToJson(this);
}
