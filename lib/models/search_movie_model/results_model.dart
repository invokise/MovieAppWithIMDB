import 'package:json_annotation/json_annotation.dart';
part 'results_model.g.dart';

@JsonSerializable()
class Results {
  String? id;
  String? resultType;
  String? image;
  String? title;
  String? description;

  Results({
    this.id,
    this.resultType,
    this.image,
    this.title,
    this.description,
  });

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);

  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}
