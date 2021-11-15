import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:news_ai/src/data/controllers/controllers.dart';

class Notifications extends StatelessWidget {
  Notifications({Key? key}) : super(key: key);

  final NotificationController _notificationController = NotificationController.to;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Badge(
      position: BadgePosition.topEnd(top: 6.0, end: 6.0),
      padding: const EdgeInsets.all(4.0),
      badgeContent: null,
      badgeColor: Colors.grey,
      showBadge: _notificationController.isNotification.value,
      child: IconButton(
        tooltip: 'Уведомления',
        icon: const Icon(
          LineIcons.bell,
          size: 24.0,
          // color: Theme.of(context).textTheme.bodyText1!.color,
        ),
        onPressed: () {
          if (!_notificationController.isNotification.value) {
            Get.defaultDialog(
              title: 'Уведомления',
              content: const Text('У вас нет новых уведомлений'),
            );
          }
        },
      ),
    ),
    );
  }
}
