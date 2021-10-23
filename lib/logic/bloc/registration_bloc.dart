import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo/data/models/user.dart';
import 'package:todo/data/repositories/user_repositories.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc({required UserRepository userRepository})
      : super(RegistrationInitial()) {
    _userRepository = userRepository;
    on<RegistrationEvent>(_userRegistration);
  }

  late UserRepository _userRepository;

  void _userRegistration(
      RegistrationEvent event, Emitter<RegistrationState> emit) async {
    if (event is SignupButtonPressed) {
      emit(RegistrationLoading());
      try {
        await _userRepository.signUp(
            event.email, event.password, event.userName);

        final UserModel userModel = await _userRepository.getUser();
        emit(RegistrationSuccess(userModel));
      } catch (e) {
        emit(RegistrationFailure(e.toString()));
      }
    }
  }
}
