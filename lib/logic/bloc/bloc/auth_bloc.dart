import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo/data/models/user.dart';
import 'package:todo/data/repositories/user_repositories.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AppBloc extends Bloc<AuthEvent, AuthState> {
  AppBloc({required UserRepository userRepository})
      : super(AuthInitialState()) {
    _userRepository = userRepository;
    on<AppStartedEvent>(_onAppStarted);
  }
  late UserRepository _userRepository;

  void _onAppStarted(AppStartedEvent event, Emitter<AuthState> emit) async {
    try {
      final isSignedIn = await _userRepository.isSignedIn();

      if (isSignedIn) {
        final UserModel _user = await _userRepository.getUser();
        emit(AuthenticatedState(_user));
      } else {
        emit(UnauthenticatedState());
      }
    } catch (e) {
      emit(UnauthenticatedState());
    }
  }
}
