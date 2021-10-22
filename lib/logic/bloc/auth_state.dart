part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthInitialState extends AuthState {
  @override
  String toString() => 'AuthInitialState';
}

class AuthenticatedState extends AuthState {
  final UserModel user;

  AuthenticatedState(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'AuthenticatedState(user: $user)';
}

class UnauthenticatedState extends AuthState {
  @override
  String toString() => 'UnauthenticatedState';
}
