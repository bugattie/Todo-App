part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

class SignupButtonPressed extends RegistrationEvent {
  final String email, password, userName;

  const SignupButtonPressed(this.email, this.password, this.userName);

  @override
  List<Object> get props => [email, password, userName];
}
