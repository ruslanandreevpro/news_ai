import 'package:equatable/equatable.dart';

abstract class SignInEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SignInEmailChange extends SignInEvent {
  final String? email;

  SignInEmailChange({this.email});

  @override
  List<Object> get props => [email!];
}

class SignInPasswordChanged extends SignInEvent {
  final String? password;

  SignInPasswordChanged({this.password});

  @override
  List<Object> get props => [password!];
}

class SignInWithCredentialsPressed extends SignInEvent {
  final String email;
  final String password;

  SignInWithCredentialsPressed({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
