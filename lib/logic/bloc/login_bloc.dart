import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo/data/models/user.dart';
import 'package:todo/data/repositories/user_repositories.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required UserRepository userRepository}) : super(LoginInitial()) {
    _userRepository = userRepository;
    on<LoginEvent>(_userLogin);
  }

  late UserRepository _userRepository;

  void _userLogin(LoginEvent event, Emitter<LoginState> emit) async {
    if (event is LogInButtonPressed) {
      emit(LoginLoading());
      try {
        _userRepository.signInWithCredentials(event.email, event.password);

        final UserModel userModel = await _userRepository.getUser();
        emit(LoginSuccess(userModel));
      } catch (e) {
        emit(LoginFailure(e.toString()));
      }
    }
  }
}
