import 'product_search_page_model.dart';

class ProductPageSearchSuccessModel extends ProductPageSearchModel {
  List<Data>? data;
  int? currentPage;
  int? totalPages;
  int? totalCount;
  int? pageSize;
  bool? hasPreviousPage;
  bool? hasNextPage;

  ProductPageSearchSuccessModel(
      {this.data,
      this.currentPage,
      this.totalPages,
      this.totalCount,
      this.pageSize,
      this.hasPreviousPage,
      this.hasNextPage});

  ProductPageSearchSuccessModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    currentPage = json['currentPage'];
    totalPages = json['totalPages'];
    totalCount = json['totalCount'];
    pageSize = json['pageSize'];
    hasPreviousPage = json['hasPreviousPage'];
    hasNextPage = json['hasNextPage'];
  }
}

class Data {
  int? pageId;
  String? pageName;
  int? storeId;
  String? storeName;
  String? storeImage;
  bool? isAddToFavoraite;
  int? rate;
  List<StorePageTypesDto>? storePageTypesDto;
  List<StorePageProductsDto>? storePageProductsDto;

  Data(
      {this.pageId,
      this.pageName,
      this.storeId,
      this.storeName,
      this.storeImage,
      this.isAddToFavoraite,
      this.rate,
      this.storePageTypesDto,
      this.storePageProductsDto});

  Data.fromJson(Map<String, dynamic> json) {
    pageId = json['pageId'];
    pageName = json['pageName'];
    storeId = json['storeId'];
    storeName = json['storeName'];
    storeImage = json['storeImage'];
    isAddToFavoraite = json['isAddToFavoraite'];
    rate = json['rate'];
    if (json['storePageTypesDto'] != null) {
      storePageTypesDto = <StorePageTypesDto>[];
      json['storePageTypesDto'].forEach((v) {
        storePageTypesDto!.add(new StorePageTypesDto.fromJson(v));
      });
    }
    if (json['storePageProductsDto'] != null) {
      storePageProductsDto = <StorePageProductsDto>[];
      json['storePageProductsDto'].forEach((v) {
        storePageProductsDto!.add(new StorePageProductsDto.fromJson(v));
      });
    }
  }
}

class StorePageTypesDto {
  int? storeTypeId;
  String? storeTypeName;
  String? storeTypeImage;

  StorePageTypesDto(
      {this.storeTypeId, this.storeTypeName, this.storeTypeImage});

  StorePageTypesDto.fromJson(Map<String, dynamic> json) {
    storeTypeId = json['storeTypeId'];
    storeTypeName = json['storeTypeName'];
    storeTypeImage = json['storeTypeImage'];
  }
}

class StorePageProductsDto {
  String? productId;
  String? productName;
  int? productPrice;
  String? productImage;
  String? productRate;
  String? productQuantity;
  bool? isAddToFavoraite;
  int? storeTypeId;

  StorePageProductsDto(
      {this.productId,
      this.productName,
      this.productPrice,
      this.productImage,
      this.productRate,
      this.productQuantity,
      this.isAddToFavoraite,
      this.storeTypeId});

  StorePageProductsDto.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productName = json['productName'];
    productPrice = json['productPrice'];
    productImage = json['productImage'];
    productRate = json['productRate'];
    productQuantity = json['productQuantity'];
    isAddToFavoraite = json['isAddToFavoraite'];
    storeTypeId = json['storeTypeId'];
  }
}
