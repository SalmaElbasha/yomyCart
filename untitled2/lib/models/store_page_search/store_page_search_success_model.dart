import 'store_page_search_model.dart';

class StorePageSearchSuccessModel extends StorePageSearchModel {
  List<Data>? data;
  int? currentPage;
  int? totalPages;
  int? totalCount;
  int? pageSize;
  bool? hasPreviousPage;
  bool? hasNextPage;

  StorePageSearchSuccessModel(
      {this.data,
      this.currentPage,
      this.totalPages,
      this.totalCount,
      this.pageSize,
      this.hasPreviousPage,
      this.hasNextPage});

  StorePageSearchSuccessModel.fromJson(Map<String, dynamic> json) {
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
        storePageTypesDto!.add(StorePageTypesDto.fromJson(v));
      });
    }
    if (json['storePageProductsDto'] != null) {
      storePageProductsDto = <StorePageProductsDto>[];
      json['storePageProductsDto'].forEach((v) {
        storePageProductsDto!.add(StorePageProductsDto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pageId'] = pageId;
    data['pageName'] = pageName;
    data['storeId'] = storeId;
    data['storeName'] = storeName;
    data['storeImage'] = storeImage;
    data['isAddToFavoraite'] = isAddToFavoraite;
    data['rate'] = rate;
    if (storePageTypesDto != null) {
      data['storePageTypesDto'] =
          storePageTypesDto!.map((v) => v.toJson()).toList();
    }
    if (storePageProductsDto != null) {
      data['storePageProductsDto'] =
          storePageProductsDto!.map((v) => v.toJson()).toList();
    }
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['storeTypeId'] = storeTypeId;
    data['storeTypeName'] = storeTypeName;
    data['storeTypeImage'] = storeTypeImage;
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productId'] = productId;
    data['productName'] = productName;
    data['productPrice'] = productPrice;
    data['productImage'] = productImage;
    data['productRate'] = productRate;
    data['productQuantity'] = productQuantity;
    data['isAddToFavoraite'] = isAddToFavoraite;
    data['storeTypeId'] = storeTypeId;
    return data;
  }
}
