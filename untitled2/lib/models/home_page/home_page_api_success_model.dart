import 'package:json_annotation/json_annotation.dart';

import 'home_page_api_model.dart';

part 'home_page_api_success_model.g.dart';

@JsonSerializable()
class HomePageApiSuccessModel extends HomePageApiModel {
  final List<Data>? data;
  final int? currentPage;
  final int? totalPages;
  final int? totalCount;
  final int? pageSize;
  final bool? hasPreviousPage;
  final bool? hasNextPage;

  HomePageApiSuccessModel({
    this.data,
    this.currentPage,
    this.totalPages,
    this.totalCount,
    this.pageSize,
    this.hasPreviousPage,
    this.hasNextPage,
  });

  factory HomePageApiSuccessModel.fromJson(Map<String, dynamic> json) =>
      _$HomePageApiSuccessModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomePageApiSuccessModelToJson(this);
}

@JsonSerializable()
class Data {
  final int? pageId;
  final String? pageName;
  final int? siteSliderId;
  final String? siteSliderName;
  final int? sliderContentId;
  final String? sliderContentName;
  final int? sliderShapeId;
  final String? sliderShapeName;
  final int? sliderOrder;
  final int? sliderItemCount;
  final String? sliderOrientation;
  final String? sliderColor;
  final int? sliderWidth;
  final int? sliderHeight;
  final List<Homepagedetaildto>? homePageDetailDto;

  const Data({
    this.pageId,
    this.pageName,
    this.siteSliderId,
    this.siteSliderName,
    this.sliderContentId,
    this.sliderContentName,
    this.sliderShapeId,
    this.sliderShapeName,
    this.sliderOrder,
    this.sliderItemCount,
    this.sliderOrientation,
    this.sliderColor,
    this.sliderWidth,
    this.sliderHeight,
    this.homePageDetailDto,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Homepagedetaildto {
  final int? sliderItemId;
  final String? sliderItemName;
  final int? sliderItemNatureId;
  final String? sliderItemNatureName;
  final int? siteSliderItemTypeId;
  final String? siteSliderItemTypeName;
  final String? siteSliderItemDesc;
  final int? destinationPage;
  final int? targetCode;
  final String? externalLink;
  final String? sliderItemImage;
  final String? sliderItemLocation;
  final num? rate;

  const Homepagedetaildto({
    this.sliderItemId,
    this.sliderItemName,
    this.sliderItemNatureId,
    this.sliderItemNatureName,
    this.siteSliderItemTypeId,
    this.siteSliderItemTypeName,
    this.siteSliderItemDesc,
    this.destinationPage,
    this.targetCode,
    this.externalLink,
    this.sliderItemImage,
    this.sliderItemLocation,
    this.rate,
  });

  factory Homepagedetaildto.fromJson(Map<String, dynamic> json) =>
      _$HomepagedetaildtoFromJson(json);

  Map<String, dynamic> toJson() => _$HomepagedetaildtoToJson(this);
}
