import 'package:get/get.dart';

class MessageController extends GetxController {
  static MessageController to = Get.find();

  RxBool isMessage = false.obs;
  RxInt messageCount = 0.obs;
}