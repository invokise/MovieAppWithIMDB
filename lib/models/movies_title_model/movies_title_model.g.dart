// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_title_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesTitle _$MoviesTitleFromJson(Map<String, dynamic> json) => MoviesTitle(
      id: json['id'] as String?,
      title: json['title'] as String?,
      originalTitle: json['originalTitle'] as String?,
      fullTitle: json['fullTitle'] as String?,
      type: json['type'] as String?,
      year: json['year'] as String?,
      image: json['image'] as String?,
      releaseDate: json['releaseDate'] as String?,
      runtimeMins: json['runtimeMins'] as String?,
      runtimeStr: json['runtimeStr'] as String?,
      plot: json['plot'] as String?,
      plotLocal: json['plotLocal'] as String?,
      plotLocalIsRtl: json['plotLocalIsRtl'] as bool?,
      awards: json['awards'] as String?,
      directors: json['directors'] as String?,
      writers: json['writers'] as String?,
      stars: json['stars'] as String?,
      genres: json['genres'] as String?,
      companies: json['companies'] as String?,
      countries: json['countries'] as String?,
      languages: json['languages'] as String?,
      contentRating: json['contentRating'] as String?,
      imDbRating: json['imDbRating'] as String?,
      imDbRatingVotes: json['imDbRatingVotes'] as String?,
      metacriticRating: json['metacriticRating'] as String?,
      tagline: json['tagline'] as String?,
      keywords: json['keywords'] as String?,
      keywordList: (json['keywordList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$MoviesTitleToJson(MoviesTitle instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'originalTitle': instance.originalTitle,
      'fullTitle': instance.fullTitle,
      'type': instance.type,
      'year': instance.year,
      'image': instance.image,
      'releaseDate': instance.releaseDate,
      'runtimeMins': instance.runtimeMins,
      'runtimeStr': instance.runtimeStr,
      'plot': instance.plot,
      'plotLocal': instance.plotLocal,
      'plotLocalIsRtl': instance.plotLocalIsRtl,
      'awards': instance.awards,
      'directors': instance.directors,
      'writers': instance.writers,
      'stars': instance.stars,
      'genres': instance.genres,
      'companies': instance.companies,
      'countries': instance.countries,
      'languages': instance.languages,
      'contentRating': instance.contentRating,
      'imDbRating': instance.imDbRating,
      'imDbRatingVotes': instance.imDbRatingVotes,
      'metacriticRating': instance.metacriticRating,
      'tagline': instance.tagline,
      'keywords': instance.keywords,
      'keywordList': instance.keywordList,
    };
