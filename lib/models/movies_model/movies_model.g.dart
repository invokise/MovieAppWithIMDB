// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movies _$MoviesFromJson(Map<String, dynamic> json) => Movies(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Items.fromJson(e as Map<String, dynamic>))
          .toList(),
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$MoviesToJson(Movies instance) => <String, dynamic>{
      'items': instance.items,
      'errorMessage': instance.errorMessage,
    };
