import 'register_model.dart';

class RegisterError400Model extends RegisterModel {
  String? type;
  String? title;
  int? status;
  String? detail;
  String? instance;
  // Errors? errors;
  Map<String, dynamic>? errors;
  String? additionalProp1;
  String? additionalProp2;
  String? additionalProp3;

  RegisterError400Model(
      {this.type,
      this.title,
      this.status,
      this.detail,
      this.instance,
      this.errors,
      this.additionalProp1,
      this.additionalProp2,
      this.additionalProp3});

  RegisterError400Model.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    title = json['title'];
    status = json['status'];
    detail = json['detail'];
    instance = json['instance'];
    // errors = json['errors'] != null ? Errors.fromJson(json['errors']) : null;
    errors = json['errors'];
    additionalProp1 = json['additionalProp1'];
    additionalProp2 = json['additionalProp2'];
    additionalProp3 = json['additionalProp3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['title'] = title;
    data['status'] = status;
    data['detail'] = detail;
    data['instance'] = instance;
    if (errors != null) {
      // data['errors'] = errors!.toJson();
    }
    data['additionalProp1'] = additionalProp1;
    data['additionalProp2'] = additionalProp2;
    data['additionalProp3'] = additionalProp3;
    return data;
  }
}

class Errors {
  List<String>? additionalProp1;
  List<String>? additionalProp2;
  List<String>? additionalProp3;

  Errors({this.additionalProp1, this.additionalProp2, this.additionalProp3});

  Errors.fromJson(Map<String, dynamic> json) {
    json['additionalProp1'].forEach((elemnt) => additionalProp1!.add(elemnt));
    json['additionalProp2'].forEach((elemnt) => additionalProp2!.add(elemnt));
    json['additionalProp3'].forEach((elemnt) => additionalProp3!.add(elemnt));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['additionalProp1'] = additionalProp1;
    data['additionalProp2'] = additionalProp2;
    data['additionalProp3'] = additionalProp3;
    return data;
  }
}
