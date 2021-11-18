import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_ai/src/bloc/auth/authentication_event.dart';
import 'package:news_ai/src/bloc/auth/authentication_state.dart';
import 'package:news_ai/src/bloc/bloc.dart';
import 'package:news_ai/src/data/repositories/repositories.dart';
import 'package:url_strategy/url_strategy.dart';

import 'src/ui/ui.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  final UserRepository userRepository = UserRepository();
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  runApp(BlocProvider(
    create: (context) => AuthenticationBloc(
      userRepository: userRepository,
    )..add(AuthenticationStarted()),
    child: NewsAIApp(
      userRepository: userRepository,
    ),
  ),);
}

class NewsAIApp extends StatelessWidget {
  final UserRepository _userRepository;

  NewsAIApp({required UserRepository userRepository}) : _userRepository = userRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News AI',
      theme: ThemeData.light(),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationFailure) {
            return SignInUI(userRepository: _userRepository);
          }

          if (state is AuthenticationSuccess) {
            return HomeUI(user: state.user);
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
