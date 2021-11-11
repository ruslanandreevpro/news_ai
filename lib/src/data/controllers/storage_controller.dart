import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';
import 'package:news_ai/src/core/constants/constants.dart';

class StorageController extends GetxController {
  static StorageController to = Get.find();

  Client client = Client();

  late Storage _storage;

  @override
  void onReady() {
    client
        .setEndpoint(AppwriteServer.apiEndpoint)
        .setProject(AppwriteServer.projectID);
    _storage = Storage(client);
    super.onReady();
  }
}