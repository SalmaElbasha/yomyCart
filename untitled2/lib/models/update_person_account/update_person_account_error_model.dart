import 'package:untitled2/models/update_person_account/update_person_account_model.dart';

class UpdatePersonalAccountErrorModel extends UpdatePersonalAccountModel {
  List<String>? messages;
  String? source;
  String? exception;
  String? errorId;
  String? supportMessage;
  int? statusCode;

  UpdatePersonalAccountErrorModel(
      {this.messages,
      this.source,
      this.exception,
      this.errorId,
      this.supportMessage,
      this.statusCode});

  UpdatePersonalAccountErrorModel.fromJson(Map<String, dynamic> json) {
    messages = json['messages'].cast<String>();
    source = json['source'];
    exception = json['exception'];
    errorId = json['errorId'];
    supportMessage = json['supportMessage'];
    statusCode = json['statusCode'];
  }
}
