// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_api_error400_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomePageApiError400Model _$HomePageApiError400ModelFromJson(
        Map<String, dynamic> json) =>
    HomePageApiError400Model(
      type: json['type'] as String? ?? '',
      title: json['title'] as String? ?? '',
      status: json['status'] as int? ?? 0,
      detail: json['detail'] as String? ?? '',
      instance: json['instance'] as String? ?? '',
      errors: json['errors'] == null
          ? null
          : Errors.fromJson(json['errors'] as Map<String, dynamic>),
      additionalProp1: json['additionalProp1'] as String? ?? '',
      additionalProp2: json['additionalProp2'] as String? ?? '',
      additionalProp3: json['additionalProp3'] as String? ?? '',
    );

Map<String, dynamic> _$HomePageApiError400ModelToJson(
        HomePageApiError400Model instance) =>
    <String, dynamic>{
      'type': instance.type,
      'title': instance.title,
      'status': instance.status,
      'detail': instance.detail,
      'instance': instance.instance,
      'errors': instance.errors,
      'additionalProp1': instance.additionalProp1,
      'additionalProp2': instance.additionalProp2,
      'additionalProp3': instance.additionalProp3,
    };

Errors _$ErrorsFromJson(Map<String, dynamic> json) => Errors(
      additionalProp1: (json['additionalProp1'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      additionalProp2: (json['additionalProp2'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      additionalProp3: (json['additionalProp3'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$ErrorsToJson(Errors instance) => <String, dynamic>{
      'additionalProp1': instance.additionalProp1,
      'additionalProp2': instance.additionalProp2,
      'additionalProp3': instance.additionalProp3,
    };
