import 'brand_page_model.dart';

class BrandPageSuccessModel extends BrandPageModel {
  List<Data>? data;
  int? currentPage;
  int? totalPages;
  int? totalCount;
  int? pageSize;
  bool? hasPreviousPage;
  bool? hasNextPage;

  BrandPageSuccessModel(
      {this.data,
      this.currentPage,
      this.totalPages,
      this.totalCount,
      this.pageSize,
      this.hasPreviousPage,
      this.hasNextPage});

  BrandPageSuccessModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    currentPage = json['currentPage'];
    totalPages = json['totalPages'];
    totalCount = json['totalCount'];
    pageSize = json['pageSize'];
    hasPreviousPage = json['hasPreviousPage'];
    hasNextPage = json['hasNextPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['currentPage'] = currentPage;
    data['totalPages'] = totalPages;
    data['totalCount'] = totalCount;
    data['pageSize'] = pageSize;
    data['hasPreviousPage'] = hasPreviousPage;
    data['hasNextPage'] = hasNextPage;
    return data;
  }
}

class Data {
  int? pageId;
  String? pageName;
  int? brandId;
  String? brandName;
  String? brandImage;
  bool? isAddToFavoraite;
  List<BrandStoresDto>? brandStoresDto;

  Data(
      {this.pageId,
      this.pageName,
      this.brandId,
      this.brandName,
      this.brandImage,
      this.isAddToFavoraite,
      this.brandStoresDto});

  Data.fromJson(Map<String, dynamic> json) {
    pageId = json['pageId'];
    pageName = json['pageName'];
    brandId = json['brandId'];
    brandName = json['brandName'];
    brandImage = json['brandImage'];
    isAddToFavoraite = json['isAddToFavoraite'];
    if (json['brandStoresDto'] != null) {
      brandStoresDto = <BrandStoresDto>[];
      json['brandStoresDto'].forEach((v) {
        brandStoresDto!.add(BrandStoresDto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pageId'] = pageId;
    data['pageName'] = pageName;
    data['brandId'] = brandId;
    data['brandName'] = brandName;
    data['brandImage'] = brandImage;
    data['isAddToFavoraite'] = isAddToFavoraite;
    if (brandStoresDto != null) {
      data['brandStoresDto'] = brandStoresDto!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BrandStoresDto {
  int? storeId;
  String? storeName;
  String? storeImage;
  bool? isAddToFavoraite;
  int? rate;

  BrandStoresDto(
      {this.storeId,
      this.storeName,
      this.storeImage,
      this.isAddToFavoraite,
      this.rate});

  BrandStoresDto.fromJson(Map<String, dynamic> json) {
    storeId = json['storeId'];
    storeName = json['storeName'];
    storeImage = json['storeImage'];
    isAddToFavoraite = json['isAddToFavoraite'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['storeId'] = storeId;
    data['storeName'] = storeName;
    data['storeImage'] = storeImage;
    data['isAddToFavoraite'] = isAddToFavoraite;
    data['rate'] = rate;
    return data;
  }
}
