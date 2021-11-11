import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';
import 'package:news_ai/src/core/constants/constants.dart';

class AvatarsController extends GetxController {
  static AvatarsController to = Get.find();

  Client client = Client();

  late Avatars _avatars;

  @override
  void onReady() {
    client
        .setEndpoint(AppwriteServer.apiEndpoint)
        .setProject(AppwriteServer.projectID);
    _avatars = Avatars(client);
    super.onReady();
  }
}