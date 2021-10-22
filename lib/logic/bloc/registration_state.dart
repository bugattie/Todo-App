part of 'registration_bloc.dart';

abstract class RegistrationState extends Equatable {
  const RegistrationState();

  @override
  List<Object> get props => [];
}

class RegistrationInitial extends RegistrationState {
  @override
  String toString() => 'RegistrationInitial';
}

class RegistrationLoading extends RegistrationState {
  @override
  String toString() => 'RegistrationLoading';
}

class RegistrationSuccess extends RegistrationState {
  final UserModel userModel;

  const RegistrationSuccess(this.userModel);

  @override
  List<Object> get props => [userModel];

  @override
  String toString() => 'RegistrationSuccess(userModel: $userModel)';
}

class RegistrationFailure extends RegistrationState {
  final String errorMessage;

  const RegistrationFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() => 'RegistrationFailure(errorMessage: $errorMessage)';
}
