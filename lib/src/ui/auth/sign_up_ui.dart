import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:news_ai/src/bloc/bloc.dart';
import 'package:news_ai/src/data/repositories/repositories.dart';
import 'package:news_ai/src/widgets/widgets.dart';

class SignUpUI extends StatelessWidget {
  final UserRepository _userRepository;

  SignUpUI({Key? key, required UserRepository userRepository})
      : _userRepository = userRepository,
        super(key: key);

  static const String routeName = '/sign_up';

  Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => SignUpUI(userRepository: _userRepository,),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<SignUpBloc>(
        create: (context) => SignUpBloc(userRepository: _userRepository),
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
                        children: const [
                          Text('Регистрация'),
                          SizedBox(height: 24.0,),
                          SignUpForm(),
                        ],
                      ),
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
