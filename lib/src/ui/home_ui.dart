import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:news_ai/src/data/controllers/controllers.dart';
import 'package:news_ai/src/widgets/widgets.dart';

class HomeUI extends StatelessWidget {
  HomeUI({Key? key}) : super(key: key);

  final AuthController _authController = AuthController.to;

  final MessageController _messageController = MessageController.to;
  final NotificationController _notificationController = NotificationController.to;
  final CustomDrawerController _customDrawerController = CustomDrawerController.to;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SliderMenuContainer(
          key: _customDrawerController.sliderMenuKey,
          appBarColor: Theme.of(context).scaffoldBackgroundColor,
          appBarHeight: 56.0,
          appBarPadding: const EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 0.0),
          isDraggable: false,
          title: Obx(() => Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
            child: Text(
              _customDrawerController.pages[_customDrawerController.currentPage.value].title,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          )),
          isTitleCenter: false,
          trailing: Row(
            children: [
              Obx(() => Badge(
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
              ),),
              Obx(() => Badge(
                position: BadgePosition.topEnd(top: 6.0, end: 6.0),
                padding: const EdgeInsets.all(4.0),
                badgeContent: null,
                badgeColor: Colors.grey,
                showBadge: _messageController.isMessage.value,
                child: IconButton(
                  tooltip: 'Сообщение',
                  icon: const Icon(
                    LineIcons.envelope,
                    size: 24.0,
                    // color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                  onPressed: () {
                    if (!_messageController.isMessage.value) {
                      Get.defaultDialog(
                        title: 'Сообщения',
                        content: const Text('У вас нет новых сообщений'),
                      );
                    }
                  },
                ),
              ),),
              PopupMenuButton(
                tooltip: 'Меню пользователя',
                icon: Avatar(photoUrl: '', size: 12.0),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'SIGN_OUT',
                    child: Row(
                      children: [
                        Icon(LineIcons.powerOff, color: Theme.of(context).textTheme.bodyText1!.color,),
                        const SizedBox(
                          width: 16.0,
                        ),
                        const Text('Выход'),
                      ],
                    ),
                  ),
                ],
                onSelected: (value) {
                  switch (value) {
                    case 'SETTINGS':
                      Get.offAndToNamed('/settings');
                      break;
                    case 'PROFILE':
                      Get.offAndToNamed('/profile');
                      break;
                    case 'SIGN_OUT':
                      _authController.signOut();
                      break;
                  }
                },
              ),
              // Obx(() => Badge(
              //   position: BadgePosition.topEnd(top: 6.0, end: 6.0),
              //   padding: const EdgeInsets.all(4.0),
              //   badgeContent: null,
              //   badgeColor: Colors.green, // (_authController.currentUser.value?.presence  == true) ? Colors.green : Colors.grey,
              //   child: PopupMenuButton(
              //     tooltip: 'Меню пользователя',
              //     icon: Avatar(photoUrl: '', size: 12.0),
              //     itemBuilder: (context) => [
              //       PopupMenuItem(
              //         value: 'SIGN_OUT',
              //         child: Row(
              //           children: [
              //             Icon(LineIcons.powerOff, color: Theme.of(context).textTheme.bodyText1!.color,),
              //             const SizedBox(
              //               width: 16.0,
              //             ),
              //             const Text('Выход'),
              //           ],
              //         ),
              //       ),
              //     ],
              //     onSelected: (value) {
              //       switch (value) {
              //         case 'SETTINGS':
              //           Get.offAndToNamed('/settings');
              //           break;
              //         case 'PROFILE':
              //           Get.offAndToNamed('/profile');
              //           break;
              //         case 'SIGN_OUT':
              //           // _authController.signOut();
              //           break;
              //       }
              //     },
              //   ),
              // ),
              // ),
              // Badge(
              //   position: BadgePosition.topEnd(top: 6.0, end: 6.0),
              //   padding: const EdgeInsets.all(4.0),
              //   badgeContent: null,
              //   badgeColor: Colors.green, // (_authController.currentUser.value?.presence  == true) ? Colors.green : Colors.grey,
              //   child: PopupMenuButton(
              //     tooltip: 'Меню пользователя',
              //     icon: Avatar(photoUrl: '', size: 12.0),
              //     itemBuilder: (context) => [
              //       PopupMenuItem(
              //         value: 'SIGN_OUT',
              //         child: Row(
              //           children: [
              //             Icon(LineIcons.powerOff, color: Theme.of(context).textTheme.bodyText1!.color,),
              //             const SizedBox(
              //               width: 16.0,
              //             ),
              //             const Text('Выход'),
              //           ],
              //         ),
              //       ),
              //     ],
              //     onSelected: (value) {
              //       switch (value) {
              //         case 'SETTINGS':
              //           Get.offAndToNamed('/settings');
              //           break;
              //         case 'PROFILE':
              //           Get.offAndToNamed('/profile');
              //           break;
              //         case 'SIGN_OUT':
              //           _authController.signOut();
              //           break;
              //       }
              //     },
              //   ),
              // ),
            ],
          ),
          sliderMenu: CustomDrawer(),
          sliderMain: Obx(() => SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: _customDrawerController.pages[_customDrawerController.currentPage.value].page),
          ),
        ),
      ),
    );
  }
}
