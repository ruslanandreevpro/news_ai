import 'package:get/get.dart';

class NotificationController extends GetxController {
  static NotificationController to = Get.find();

  RxBool isNotification = false.obs;
}