import 'package:untitled2/models/Store_page/store_page_model.dart';

class StorePageErrorModel extends StorePageModel {
  List<String>? messages;
  String? source;
  String? exception;
  String? errorId;
  String? supportMessage;
  int? statusCode;

  StorePageErrorModel(
      {this.messages,
        this.source,
        this.exception,
        this.errorId,
        this.supportMessage,
        this.statusCode});

  StorePageErrorModel.fromJson(Map<String, dynamic> json) {
    messages = json['messages'].cast<String>();
    source = json['source'];
    exception = json['exception'];
    errorId = json['errorId'];
    supportMessage = json['supportMessage'];
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['messages'] = messages;
    data['source'] = source;
    data['exception'] = exception;
    data['errorId'] = errorId;
    data['supportMessage'] = supportMessage;
    data['statusCode'] = statusCode;
    return data;
  }
}
