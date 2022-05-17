// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchMovie _$SearchMovieFromJson(Map<String, dynamic> json) => SearchMovie(
      searchType: json['searchType'] as String?,
      expression: json['expression'] as String?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Results.fromJson(e as Map<String, dynamic>))
          .toList(),
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$SearchMovieToJson(SearchMovie instance) =>
    <String, dynamic>{
      'searchType': instance.searchType,
      'expression': instance.expression,
      'results': instance.results,
      'errorMessage': instance.errorMessage,
    };
