import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_ai/src/core/constants/constants.dart';
import 'package:news_ai/src/data/models/models.dart';

class AuthController extends GetxController {
  static AuthController to = Get.find();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool rememberMe = true.obs;

  RxBool isLoggedIn = false.obs;

  Rxn<UserModel> currentUser = Rxn<UserModel>();

  Client client = Client();

  late Account _account;

  @override
  void onReady() {
    client
      .setEndpoint(AppwriteServer.apiEndpoint)
      .setProject(AppwriteServer.projectID);
    _account = Account(client);
    _isAccountLoggedIn();
    super.onReady();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void _showError(AppwriteException error) {
    Get.defaultDialog(
      title: 'Ошибка',
      content: Text('Код ошибки: ${error.code!}, Ошибка: ${error.message!}'),
    );
  }

  void _isAccountLoggedIn() async {
    var result = await _account.get()
      .then((value) {
        currentUser.value = UserModel.fromMap(value.toMap());
        Get.offAllNamed('/home');
      }).catchError((error) {
        Get.offAllNamed('/');
    });
  }

  Future<void> signUpWithEmailAndPassword() async {
    var result = await _account.create(name: nameController.text, email: emailController.text.trim(), password: passwordController.text.trim())
      .then((response) {
        signInWithEmailAndPassword();
      }).catchError((error) {
        clearControllers();
        _showError(error);
    });
  }

  Future<void> signInWithEmailAndPassword() async {
    var result = await _account.createSession(email: emailController.text.trim(), password: passwordController.text.trim())
      .then((response) async {
        clearControllers();
        _isAccountLoggedIn();
      }).catchError((error) {
        clearControllers();
        _showError(error);
    });
  }

  Future<void> signOut() async {
    var result = await _account.deleteSession(sessionId: 'current')
      .then((response) {
        _isAccountLoggedIn();
      }).catchError((error) {
        _showError(error);
    });
  }

  void clearControllers() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
  }

}