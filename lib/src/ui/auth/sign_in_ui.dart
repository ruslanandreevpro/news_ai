import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:news_ai/src/bloc/bloc.dart';
import 'package:news_ai/src/data/repositories/repositories.dart';
import 'package:news_ai/src/widgets/widgets.dart';

class SignInUI extends StatelessWidget {
  final UserRepository _userRepository;

  SignInUI({Key? key, required UserRepository userRepository})
      : _userRepository = userRepository,
        super(key: key);

  static const String routeName = '/sign_in';

  Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => SignInUI(userRepository: _userRepository,),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<SignInBloc>(
        create: (context) => SignInBloc(userRepository: _userRepository),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: Get.height),
            child: IntrinsicHeight(
              child: Container(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 56.0,
                          ),
                          Text(
                            "Анализ новостного потока методами машинного обучения".toUpperCase(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          const Text('Авторизация'),
                          const SizedBox(height: 24.0,),
                          SignInForm(userRepository: _userRepository,),
                        ],
                      )
                    ),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
