import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_ai/src/core/utils/utils.dart';
import 'package:news_ai/src/data/controllers/controllers.dart';
import 'package:news_ai/src/widgets/widgets.dart';

class SignInUI extends StatelessWidget {
  SignInUI({Key? key}) : super(key: key);

  final AuthController _authController = AuthController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                    child: Container(
                      width: Responsive.isMobile() ? double.infinity : 368.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
                        child: Column(
                          children: [
                            Text(
                              "Вход в сервис".toUpperCase(),
                              style: TextStyle(
                                fontSize: 24.0,
                                color: Theme.of(context).textTheme.bodyText1!.color,
                              ),
                            ),
                            const SizedBox(
                              height: 40.0,
                            ),
                            FormInputFieldWithIcon(
                              controller: _authController.emailController,
                              iconPrefix: Icons.email,
                              labelText: 'Адрес электронной почты',
                              validator: (value) {
                                String pattern =
                                    r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
                                RegExp regex = RegExp(pattern);
                                if (!regex.hasMatch(value!)) {
                                  return 'validator.email';
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (value) => null,
                              onSaved: (value) => _authController.emailController.text = value!,
                              maxLines: 1,
                            ),
                            const SizedBox(height: 24.0,),
                            FormInputFieldWithIcon(
                              controller: _authController.passwordController,
                              iconPrefix: Icons.lock,
                              labelText: 'Пароль',
                              validator: (value) {
                                String pattern = r'^.{6,}$';
                                RegExp regex = RegExp(pattern);
                                if (!regex.hasMatch(value!)) {
                                  return 'validator.password';
                                } else {
                                  return null;
                                }
                              },
                              obscureText: true,
                              onChanged: (value) => null,
                              onSaved: (value) => _authController.passwordController.text = value!,
                              maxLines: 1,
                            ),
                            const SizedBox(height: 12.0,),
                            Obx(() => SwitchListTile(
                              title: const Text('Запомнить меня'),
                              value: _authController.rememberMe.value,
                              onChanged: (value) {
                                // _authController.rememberMe.value = value;
                              },
                              activeTrackColor: Theme.of(context).primaryColor.withOpacity(0.5),
                              activeColor: Theme.of(context).primaryColor,
                            ),),
                            const SizedBox(height: 12.0,),
                            LabelButton(
                                labelText: 'Еще не зарегистрированы? Регистрация',
                                style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all<Color>(Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.3)),
                                ),
                                onPressed: () {
                                  Get.offNamed('/sign_up');
                                }
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: Responsive.isMobile() ? double.infinity : 320.0,
                      padding: EdgeInsets.symmetric(vertical:0, horizontal: Responsive.isMobile() ? 24.0 : 0.0),
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Get.offNamed('/home');
                              _authController.signInWithEmailAndPassword();
                            },
                            child: const Text("Войти"),
                            style: ElevatedButton.styleFrom(
                              primary: Theme.of(context).primaryColor, // background
                              textStyle: const TextStyle(
                                fontSize: 24.0,
                              ),
                              elevation: 5.0,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(16.0))),
                              minimumSize: const Size(double.infinity, 64.0),
                            ),
                          ),
                          const SizedBox(
                            height: 32.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
