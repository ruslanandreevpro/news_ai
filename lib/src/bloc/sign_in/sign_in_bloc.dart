import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_ai/src/bloc/sign_in/sign_in_event.dart';
import 'package:news_ai/src/bloc/sign_in/sign_in_state.dart';
import 'package:news_ai/src/core/utils/utils.dart';
import 'package:news_ai/src/data/repositories/repositories.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final UserRepository _userRepository;

  SignInBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(SignInState.initial());

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    if (event is SignInEmailChange) {
      yield* _mapSignInEmailChangeToState(event.email ?? '');
    } else if (event is SignInPasswordChanged) {
      yield* _mapSignInPasswordChangeToState(event.password ?? '');
    } else if (event is SignInWithCredentialsPressed) {
      yield* _mapSignInWithCredentialsPressedToState(
          email: event.email, password: event.password);
    }
  }

  Stream<SignInState> _mapSignInEmailChangeToState(String email) async* {
    yield state.update(isEmailValid: Validators.isValidEmail(email));
  }

  Stream<SignInState> _mapSignInPasswordChangeToState(String password) async* {
    yield state.update(isPasswordValid: Validators.isValidPassword(password));
  }

  Stream<SignInState> _mapSignInWithCredentialsPressedToState(
      {required String email, required String password}) async* {
    yield SignInState.loading();
    try {
      await _userRepository.signInWithCredentials(email, password);
      yield SignInState.success();
    } catch (_) {
      yield SignInState.failure();
    }
  }
}
