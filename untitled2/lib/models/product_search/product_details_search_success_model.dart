import 'package:untitled2/models/product_search/product_details_search_model.dart';

class ProductDetailsSearchSuccessModel extends ProductDetailsSearchModel {
  List<Data>? data;
  int? currentPage;
  int? totalPages;
  int? totalCount;
  int? pageSize;
  bool? hasPreviousPage;
  bool? hasNextPage;

  ProductDetailsSearchSuccessModel(
      {this.data,
      this.currentPage,
      this.totalPages,
      this.totalCount,
      this.pageSize,
      this.hasPreviousPage,
      this.hasNextPage});

  ProductDetailsSearchSuccessModel.fromJson(Map<String, dynamic> json) {
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
  List<ProductDetailsPageDataDto>? productDetailsPageDataDto;

  Data(
      {this.pageId,
      this.pageName,
      this.storeId,
      this.storeName,
      this.storeImage,
      this.isAddToFavoraite,
      this.rate,
      this.productDetailsPageDataDto});

  Data.fromJson(Map<String, dynamic> json) {
    pageId = json['pageId'];
    pageName = json['pageName'];
    storeId = json['storeId'];
    storeName = json['storeName'];
    storeImage = json['storeImage'];
    isAddToFavoraite = json['isAddToFavoraite'];
    rate = json['rate'];
    if (json['productDetailsPageDataDto'] != null) {
      productDetailsPageDataDto = <ProductDetailsPageDataDto>[];
      json['productDetailsPageDataDto'].forEach((v) {
        productDetailsPageDataDto!.add(ProductDetailsPageDataDto.fromJson(v));
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
    if (productDetailsPageDataDto != null) {
      data['productDetailsPageDataDto'] =
          productDetailsPageDataDto!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductDetailsPageDataDto {
  int? productId;
  String? productName;
  int? productPrice;
  String? productImage;
  String? productRate;
  String? productQuantity;
  bool? isAddToFavoraite;

  ProductDetailsPageDataDto(
      {this.productId,
      this.productName,
      this.productPrice,
      this.productImage,
      this.productRate,
      this.productQuantity,
      this.isAddToFavoraite});

  ProductDetailsPageDataDto.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productName = json['productName'];
    productPrice = json['productPrice'];
    productImage = json['productImage'];
    productRate = json['productRate'];
    productQuantity = json['productQuantity'];
    isAddToFavoraite = json['isAddToFavoraite'];
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
    return data;
  }
}
