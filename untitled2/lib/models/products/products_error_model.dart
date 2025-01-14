import 'products_model.dart';

class ProductsErrorModel extends ProductsModel {
  List<String>? messages;
  String? source;
  String? exception;
  String? errorId;
  String? supportMessage;
  int? statusCode;

  ProductsErrorModel(
      {this.messages,
      this.source,
      this.exception,
      this.errorId,
      this.supportMessage,
      this.statusCode});

  ProductsErrorModel.fromJson(Map<String, dynamic> json) {
    messages = json['messages'].cast<String>();
    source = json['source'];
    exception = json['exception'];
    errorId = json['errorId'];
    supportMessage = json['supportMessage'];
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['messages'] = this.messages;
    data['source'] = this.source;
    data['exception'] = this.exception;
    data['errorId'] = this.errorId;
    data['supportMessage'] = this.supportMessage;
    data['statusCode'] = this.statusCode;
    return data;
  }
}
