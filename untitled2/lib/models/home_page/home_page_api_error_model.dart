import 'package:json_annotation/json_annotation.dart';

import 'home_page_api_model.dart';

part 'home_page_api_error_model.g.dart';

@JsonSerializable()
class HomePageApiErrorModel extends HomePageApiModel {
  @JsonKey(defaultValue: [])
  final List<String> messages;
  @JsonKey(defaultValue: '')
  final String source;
  @JsonKey(defaultValue: '')
  final String exception;
  @JsonKey(defaultValue: '')
  final String errorId;
  @JsonKey(defaultValue: '')
  final String supportMessage;
  @JsonKey(defaultValue: 0)
  final int statusCode;

  HomePageApiErrorModel({
    required this.messages,
    required this.source,
    required this.exception,
    required this.errorId,
    required this.supportMessage,
    required this.statusCode,
  });

  factory HomePageApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$HomePageApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomePageApiErrorModelToJson(this);
}
