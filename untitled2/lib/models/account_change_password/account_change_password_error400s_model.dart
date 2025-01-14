import 'account_change_password_model.dart';

class AccountChangePasswordError400Model extends AccountChangePasswordModel {
  String? type;
  String? title;
  int? status;
  String? detail;
  String? instance;
  Errors? errors;
  String? additionalProp1;
  String? additionalProp2;
  String? additionalProp3;

  AccountChangePasswordError400Model(
      {this.type,
      this.title,
      this.status,
      this.detail,
      this.instance,
      this.errors,
      this.additionalProp1,
      this.additionalProp2,
      this.additionalProp3});

  AccountChangePasswordError400Model.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    title = json['title'];
    status = json['status'];
    detail = json['detail'];
    instance = json['instance'];
    errors = json['errors'] != null ? Errors.fromJson(json['errors']) : null;
    additionalProp1 = json['additionalProp1'];
    additionalProp2 = json['additionalProp2'];
    additionalProp3 = json['additionalProp3'];
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
}
