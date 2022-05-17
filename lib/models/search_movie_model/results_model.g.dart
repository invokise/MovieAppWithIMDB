// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'results_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Results _$ResultsFromJson(Map<String, dynamic> json) => Results(
      id: json['id'] as String?,
      resultType: json['resultType'] as String?,
      image: json['image'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'id': instance.id,
      'resultType': instance.resultType,
      'image': instance.image,
      'title': instance.title,
      'description': instance.description,
    };
