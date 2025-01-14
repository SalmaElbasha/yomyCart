import 'product_category_page_model.dart';

class ProductCategoryPageSuccessModel extends ProductCategoryPageModel {
  List<Data>? data;
  int? currentPage;
  int? totalPages;
  int? totalCount;
  int? pageSize;
  bool? hasPreviousPage;
  bool? hasNextPage;

  ProductCategoryPageSuccessModel(
      {this.data,
      this.currentPage,
      this.totalPages,
      this.totalCount,
      this.pageSize,
      this.hasPreviousPage,
      this.hasNextPage});

  ProductCategoryPageSuccessModel.fromJson(Map<String, dynamic> json) {
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
  int? categoryId;
  String? categoryName;
  String? categoryImage;
  bool? isAddToFavoraite;
  int? rate;
  List<NearestStoreDto>? nearestStoreDto;

  Data(
      {this.pageId,
      this.pageName,
      this.categoryId,
      this.categoryName,
      this.categoryImage,
      this.isAddToFavoraite,
      this.rate,
      this.nearestStoreDto});

  Data.fromJson(Map<String, dynamic> json) {
    pageId = json['pageId'];
    pageName = json['pageName'];
    categoryId = json['categoryId'];
    categoryName = json['categoryName'];
    categoryImage = json['categoryImage'];
    isAddToFavoraite = json['isAddToFavoraite'];
    rate = json['rate'];
    if (json['nearestStoreDto'] != null) {
      nearestStoreDto = <NearestStoreDto>[];
      json['nearestStoreDto'].forEach((v) {
        nearestStoreDto!.add(NearestStoreDto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pageId'] = pageId;
    data['pageName'] = pageName;
    data['categoryId'] = categoryId;
    data['categoryName'] = categoryName;
    data['categoryImage'] = categoryImage;
    data['isAddToFavoraite'] = isAddToFavoraite;
    data['rate'] = rate;
    if (nearestStoreDto != null) {
      data['nearestStoreDto'] =
          nearestStoreDto!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NearestStoreDto {
  int? pageId;
  String? pageName;
  int? storeId;
  String? storeName;
  String? storeImage;
  String? availability;
  bool? isAddToFavoraite;
  int? rate;

  NearestStoreDto(
      {this.pageId,
      this.pageName,
      this.storeId,
      this.storeName,
      this.storeImage,
      this.availability,
      this.isAddToFavoraite,
      this.rate});

  NearestStoreDto.fromJson(Map<String, dynamic> json) {
    pageId = json['pageId'];
    pageName = json['pageName'];
    storeId = json['storeId'];
    storeName = json['storeName'];
    storeImage = json['storeImage'];
    availability = json['availability'];
    isAddToFavoraite = json['isAddToFavoraite'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pageId'] = pageId;
    data['pageName'] = pageName;
    data['storeId'] = storeId;
    data['storeName'] = storeName;
    data['storeImage'] = storeImage;
    data['availability'] = availability;
    data['isAddToFavoraite'] = isAddToFavoraite;
    data['rate'] = rate;
    return data;
  }
}
