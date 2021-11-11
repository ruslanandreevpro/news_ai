import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';
import 'package:news_ai/src/core/constants/constants.dart';

class DatabaseController extends GetxController {
  static DatabaseController to = Get.find();

  Client client = Client();

  late Database _database;

  @override
  void onReady() {
    client
      .setEndpoint(AppwriteServer.apiEndpoint)
      .setProject(AppwriteServer.projectID);
    _database = Database(client);
    super.onReady();
  }
}