// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_api_success_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomePageApiSuccessModel _$HomePageApiSuccessModelFromJson(
        Map<String, dynamic> json) =>
    HomePageApiSuccessModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentPage: json['currentPage'] as int?,
      totalPages: json['totalPages'] as int?,
      totalCount: json['totalCount'] as int?,
      pageSize: json['pageSize'] as int?,
      hasPreviousPage: json['hasPreviousPage'] as bool?,
      hasNextPage: json['hasNextPage'] as bool?,
    );

Map<String, dynamic> _$HomePageApiSuccessModelToJson(
        HomePageApiSuccessModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'currentPage': instance.currentPage,
      'totalPages': instance.totalPages,
      'totalCount': instance.totalCount,
      'pageSize': instance.pageSize,
      'hasPreviousPage': instance.hasPreviousPage,
      'hasNextPage': instance.hasNextPage,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      pageId: json['pageId'] as int?,
      pageName: json['pageName'] as String?,
      siteSliderId: json['siteSliderId'] as int?,
      siteSliderName: json['siteSliderName'] as String?,
      sliderContentId: json['sliderContentId'] as int?,
      sliderContentName: json['sliderContentName'] as String?,
      sliderShapeId: json['sliderShapeId'] as int?,
      sliderShapeName: json['sliderShapeName'] as String?,
      sliderOrder: json['sliderOrder'] as int?,
      sliderItemCount: json['sliderItemCount'] as int?,
      sliderOrientation: json['sliderOrientation'] as String?,
      sliderColor: json['sliderColor'] as String?,
      sliderWidth: json['sliderWidth'] as int?,
      sliderHeight: json['sliderHeight'] as int?,
      homePageDetailDto: (json['homePageDetailDto'] as List<dynamic>?)
          ?.map((e) => Homepagedetaildto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'pageId': instance.pageId,
      'pageName': instance.pageName,
      'siteSliderId': instance.siteSliderId,
      'siteSliderName': instance.siteSliderName,
      'sliderContentId': instance.sliderContentId,
      'sliderContentName': instance.sliderContentName,
      'sliderShapeId': instance.sliderShapeId,
      'sliderShapeName': instance.sliderShapeName,
      'sliderOrder': instance.sliderOrder,
      'sliderItemCount': instance.sliderItemCount,
      'sliderOrientation': instance.sliderOrientation,
      'sliderColor': instance.sliderColor,
      'sliderWidth': instance.sliderWidth,
      'sliderHeight': instance.sliderHeight,
      'homePageDetailDto': instance.homePageDetailDto,
    };

Homepagedetaildto _$HomepagedetaildtoFromJson(Map<String, dynamic> json) =>
    Homepagedetaildto(
      sliderItemId: json['sliderItemId'] as int?,
      sliderItemName: json['sliderItemName'] as String?,
      sliderItemNatureId: json['sliderItemNatureId'] as int?,
      sliderItemNatureName: json['sliderItemNatureName'] as String?,
      siteSliderItemTypeId: json['siteSliderItemTypeId'] as int?,
      siteSliderItemTypeName: json['siteSliderItemTypeName'] as String?,
      siteSliderItemDesc: json['siteSliderItemDesc'] as String?,
      destinationPage: json['destinationPage'] as int?,
      targetCode: json['targetCode'] as int?,
      externalLink: json['externalLink'] as String?,
      sliderItemImage: json['sliderItemImage'] as String?,
      sliderItemLocation: json['sliderItemLocation'] as String?,
      rate: json['rate'] as num?,
    );

Map<String, dynamic> _$HomepagedetaildtoToJson(Homepagedetaildto instance) =>
    <String, dynamic>{
      'sliderItemId': instance.sliderItemId,
      'sliderItemName': instance.sliderItemName,
      'sliderItemNatureId': instance.sliderItemNatureId,
      'sliderItemNatureName': instance.sliderItemNatureName,
      'siteSliderItemTypeId': instance.siteSliderItemTypeId,
      'siteSliderItemTypeName': instance.siteSliderItemTypeName,
      'siteSliderItemDesc': instance.siteSliderItemDesc,
      'destinationPage': instance.destinationPage,
      'targetCode': instance.targetCode,
      'externalLink': instance.externalLink,
      'sliderItemImage': instance.sliderItemImage,
      'sliderItemLocation': instance.sliderItemLocation,
      'rate': instance.rate,
    };
