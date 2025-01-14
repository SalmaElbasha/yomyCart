import 'personal_account_model.dart';

class PersonalAccountSuccessModel extends PersonalAccountModel {
  String? id;
  String? userName;
  String? firstName;
  String? lastName;
  String? email;
  bool? isActive;
  bool? emailConfirmed;
  String? phoneNumber;
  String? imageUrl;

  PersonalAccountSuccessModel(
      {this.id,
      this.userName,
      this.firstName,
      this.lastName,
      this.email,
      this.isActive,
      this.emailConfirmed,
      this.phoneNumber,
      this.imageUrl});

  PersonalAccountSuccessModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    isActive = json['isActive'];
    emailConfirmed = json['emailConfirmed'];
    phoneNumber = json['phoneNumber'];
    imageUrl = json['imageUrl'];
  }
}
