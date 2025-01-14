import 'products_model.dart';

class ProductsSuccessModel extends ProductsModel {
  List<Data>? data;
  int? currentPage;
  int? totalPages;
  int? totalCount;
  int? pageSize;
  bool? hasPreviousPage;
  bool? hasNextPage;

  ProductsSuccessModel(
      {this.data,
      this.currentPage,
      this.totalPages,
      this.totalCount,
      this.pageSize,
      this.hasPreviousPage,
      this.hasNextPage});

  ProductsSuccessModel.fromJson(Map<String, dynamic> json) {
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['currentPage'] = this.currentPage;
    data['totalPages'] = this.totalPages;
    data['totalCount'] = this.totalCount;
    data['pageSize'] = this.pageSize;
    data['hasPreviousPage'] = this.hasPreviousPage;
    data['hasNextPage'] = this.hasNextPage;
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? description;
  int? rate;
  String? imagePath;
  String? brandId;
  String? brandName;

  Data(
      {this.id,
      this.name,
      this.description,
      this.rate,
      this.imagePath,
      this.brandId,
      this.brandName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    rate = json['rate'];
    imagePath = json['imagePath'];
    brandId = json['brandId'];
    brandName = json['brandName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['rate'] = this.rate;
    data['imagePath'] = this.imagePath;
    data['brandId'] = this.brandId;
    data['brandName'] = this.brandName;
    return data;
  }
}
