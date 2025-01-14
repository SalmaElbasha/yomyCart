import 'package:untitled2/models/product_details/product_details_model.dart';

class ProductDetailsSuccessModel extends ProductDetailsModel {
  int? pageId;
  String? pageName;
  int? storeId;
  String? storeName;
  String? storeImage;
  bool? isAddToFavoraite;
  int? rate;
  List<ProductDetailsPageDataDto>? productDetailsPageDataDto;

  ProductDetailsSuccessModel(
      {this.pageId,
      this.pageName,
      this.storeId,
      this.storeName,
      this.storeImage,
      this.isAddToFavoraite,
      this.rate,
      this.productDetailsPageDataDto});

  ProductDetailsSuccessModel.fromJson(Map<String, dynamic> json) {
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
        productDetailsPageDataDto!
            .add(new ProductDetailsPageDataDto.fromJson(v));
      });
    }
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
}
