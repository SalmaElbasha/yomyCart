// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_api_error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomePageApiErrorModel _$HomePageApiErrorModelFromJson(
        Map<String, dynamic> json) =>
    HomePageApiErrorModel(
      messages: (json['messages'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      source: json['source'] as String? ?? '',
      exception: json['exception'] as String? ?? '',
      errorId: json['errorId'] as String? ?? '',
      supportMessage: json['supportMessage'] as String? ?? '',
      statusCode: json['statusCode'] as int? ?? 0,
    );

Map<String, dynamic> _$HomePageApiErrorModelToJson(
        HomePageApiErrorModel instance) =>
    <String, dynamic>{
      'messages': instance.messages,
      'source': instance.source,
      'exception': instance.exception,
      'errorId': instance.errorId,
      'supportMessage': instance.supportMessage,
      'statusCode': instance.statusCode,
    };
