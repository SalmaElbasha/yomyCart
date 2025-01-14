import 'package:json_annotation/json_annotation.dart';

import 'home_page_api_model.dart';

part 'home_page_api_error400_model.g.dart';

@JsonSerializable()
class HomePageApiError400Model extends HomePageApiModel {
  @JsonKey(defaultValue: '')
  final String type;
  @JsonKey(defaultValue: '')
  final String title;
  @JsonKey(defaultValue: 0)
  final int status;
  @JsonKey(defaultValue: '')
  final String detail;
  @JsonKey(defaultValue: '')
  final String instance;
  final Errors? errors;
  @JsonKey(defaultValue: '')
  final String additionalProp1;
  @JsonKey(defaultValue: '')
  final String additionalProp2;
  @JsonKey(defaultValue: '')
  final String additionalProp3;

  HomePageApiError400Model({
    required this.type,
    required this.title,
    required this.status,
    required this.detail,
    required this.instance,
    this.errors,
    required this.additionalProp1,
    required this.additionalProp2,
    required this.additionalProp3,
  });

  factory HomePageApiError400Model.fromJson(Map<String, dynamic> json) =>
      _$HomePageApiError400ModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomePageApiError400ModelToJson(this);
}

@JsonSerializable()
class Errors {
  @JsonKey(defaultValue: [])
  final List<String> additionalProp1;
  @JsonKey(defaultValue: [])
  final List<String> additionalProp2;
  @JsonKey(defaultValue: [])
  final List<String> additionalProp3;

  const Errors({
    required this.additionalProp1,
    required this.additionalProp2,
    required this.additionalProp3,
  });

  factory Errors.fromJson(Map<String, dynamic> json) => _$ErrorsFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorsToJson(this);
}
