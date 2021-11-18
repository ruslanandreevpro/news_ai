import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:news_ai/src/widgets/widgets.dart';

class AccountMenu extends StatelessWidget {
  AccountMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      tooltip: 'Меню пользователя',
      // icon: Avatar(photoUrl: '', size: 12.0),
      child: Container(
        padding: const EdgeInsets.fromLTRB(12.0, 4.0, 12.0, 4.0),
        child: Row(
          children: [
            Avatar(photoUrl: '', size: 12.0),
            const SizedBox(width: 8.0),
            // Text(_authController.currentUser.value!.name!),
          ],
        ),
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 'SETTINGS',
          child: Row(
            children: const [
              Icon(LineIcons.cog, color: Colors.black,),
              SizedBox(
                width: 16.0,
              ),
              Text('Настройки'),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'PROFILE',
          child: Row(
            children: const [
              Icon(LineIcons.user, color: Colors.black,),
              SizedBox(
                width: 16.0,
              ),
              Text('Профиль'),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'SIGN_OUT',
          child: Row(
            children: const [
              Icon(LineIcons.powerOff, color: Colors.black,),
              SizedBox(
                width: 16.0,
              ),
              Text('Выход'),
            ],
          ),
        ),
      ],
      onSelected: (value) {
        switch (value) {
          case 'SETTINGS':
            Get.toNamed('/settings');
            break;
          case 'PROFILE':
            Get.toNamed('/profile');
            break;
          case 'SIGN_OUT':
            // _authController.signOut();
            break;
        }
      },
    );
  }
}
