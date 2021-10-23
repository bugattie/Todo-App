part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {
  @override
  String toString() => 'LoginInitial';
}

class LoginLoading extends LoginState {
  @override
  String toString() => 'LoginLoading';
}

class LoginSuccess extends LoginState {
  final UserModel userModel;

  const LoginSuccess(this.userModel);

  @override
  String toString() => 'LoginSuccess(userModel: $userModel)';
}

class LoginFailure extends LoginState {
  final String errorMessage;

  const LoginFailure(this.errorMessage);

  @override
  String toString() => 'LoginFailure(errorMessage: $errorMessage)';
}
