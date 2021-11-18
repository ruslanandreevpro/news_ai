import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_ai/src/bloc/sign_up/sign_up_event.dart';
import 'package:news_ai/src/bloc/sign_up/sign_up_state.dart';
import 'package:news_ai/src/core/utils/utils.dart';
import 'package:news_ai/src/data/repositories/repositories.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserRepository _userRepository;

  SignUpBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(SignUpState.initial());

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is SignUpEmailChanged) {
      yield* _mapSignUpEmailChangeToState(event.email ?? '');
    } else if (event is SignUpPasswordChanged) {
      yield* _mapSignUpPasswordChangeToState(event.password ?? '');
    } else if (event is SignUpSubmitted) {
      yield* _mapSignUpSubmittedToState(
          email: event.email, password: event.password, name: '');
    }
  }

  Stream<SignUpState> _mapSignUpEmailChangeToState(String email) async* {
    yield state.update(isEmailValid: Validators.isValidEmail(email));
  }

  Stream<SignUpState> _mapSignUpPasswordChangeToState(String password) async* {
    yield state.update(isPasswordValid: Validators.isValidPassword(password));
  }

  Stream<SignUpState> _mapSignUpSubmittedToState(
      {required String name, required String email, required String password}) async* {
    yield SignUpState.loading();
    try {
      await _userRepository.signUp(name, email, password);
      yield SignUpState.success();
    } catch (_) {
      yield SignUpState.failure();
    }
  }
}
