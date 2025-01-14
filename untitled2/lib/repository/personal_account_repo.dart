import '../data/remote/api_services.dart';
import '../models/Store_page/store_page_model.dart';
import '../models/personal_account/personal_account_model.dart';

class PersonalAccountRepository {
  static final instance = PersonalAccountRepository._internal();

  PersonalAccountRepository._internal();

  factory PersonalAccountRepository() => instance;

  Future<PersonalAccountModel> getPersonalAccount() async =>
      await ApiServices.instance.personalAccountApi().getPersonalAccount();
}
