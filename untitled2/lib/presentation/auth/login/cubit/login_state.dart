part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginGetTokensLoadingState extends LoginState {}

class LoginGetTokensSuccessState extends LoginState {}

class LoginGetTokensErrorState extends LoginState {}
