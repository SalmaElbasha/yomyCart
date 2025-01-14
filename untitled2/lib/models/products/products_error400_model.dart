import 'products_model.dart';

class ProductsError400Model extends ProductsModel {
  String? type;
  String? title;
  int? status;
  String? detail;
  String? instance;
  Errors? errors;
  String? additionalProp1;
  String? additionalProp2;
  String? additionalProp3;

  ProductsError400Model(
      {this.type,
      this.title,
      this.status,
      this.detail,
      this.instance,
      this.errors,
      this.additionalProp1,
      this.additionalProp2,
      this.additionalProp3});

  ProductsError400Model.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    title = json['title'];
    status = json['status'];
    detail = json['detail'];
    instance = json['instance'];
    errors =
        json['errors'] != null ? new Errors.fromJson(json['errors']) : null;
    additionalProp1 = json['additionalProp1'];
    additionalProp2 = json['additionalProp2'];
    additionalProp3 = json['additionalProp3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['title'] = this.title;
    data['status'] = this.status;
    data['detail'] = this.detail;
    data['instance'] = this.instance;
    if (this.errors != null) {
      data['errors'] = this.errors!.toJson();
    }
    data['additionalProp1'] = this.additionalProp1;
    data['additionalProp2'] = this.additionalProp2;
    data['additionalProp3'] = this.additionalProp3;
    return data;
  }
}

class Errors {
  List<String>? additionalProp1;
  List<String>? additionalProp2;
  List<String>? additionalProp3;

  Errors({this.additionalProp1, this.additionalProp2, this.additionalProp3});

  Errors.fromJson(Map<String, dynamic> json) {
    additionalProp1 = json['additionalProp1'].cast<String>();
    additionalProp2 = json['additionalProp2'].cast<String>();
    additionalProp3 = json['additionalProp3'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['additionalProp1'] = this.additionalProp1;
    data['additionalProp2'] = this.additionalProp2;
    data['additionalProp3'] = this.additionalProp3;
    return data;
  }
}
