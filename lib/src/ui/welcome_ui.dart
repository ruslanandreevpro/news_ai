import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeUI extends StatelessWidget {
  const WelcomeUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: const <Widget>[
                  Text(
                    "Сервис анализа новостей",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 16.0,),
                  Text(
                    'Анализ новостного потока методами машинного обучения',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/welcome.png"),
                    )
                ),
              ),
              Column(
                children: <Widget>[
                  MaterialButton(
                    elevation: 5.0,
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Get.offNamed('/sign_in');
                    },
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(),
                        borderRadius: BorderRadius.circular(16.0)
                    ),
                    child: const Text(
                      "Вход",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  // creating the signup button
                  const SizedBox(height:20),
                  MaterialButton(
                    elevation: 5.0,
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Get.offNamed('/sign_up');
                    },
                    color: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0)
                    ),
                    child: const Text(
                      "Регистрация",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}