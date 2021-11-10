import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_ai/src/core/routes/pages.dart';
import 'package:news_ai/src/data/controllers/controllers.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put<AuthController>(AuthController());
  Get.put<CustomDrawerController>(CustomDrawerController());
  Get.put<MessageController>(MessageController());
  Get.put<NotificationController>(NotificationController());
  setPathUrlStrategy();
  runApp(const NewsAIApp());
}

class NewsAIApp extends StatelessWidget {
  const NewsAIApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News AI',
      initialRoute: Routes.initialPage,
      getPages: AppPages.pages,
    );
  }
}
