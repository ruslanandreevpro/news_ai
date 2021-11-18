// import 'package:badges/badges.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:line_icons/line_icons.dart';
//
// class Messages extends StatelessWidget {
//   Messages({Key? key}) : super(key: key);
//
//   final MessageController _messageController = MessageController.to;
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() => Badge(
//       position: BadgePosition.topEnd(top: 6.0, end: 6.0),
//       padding: const EdgeInsets.all(4.0),
//       badgeContent: null,
//       badgeColor: Colors.grey,
//       showBadge: _messageController.isMessage.value,
//       child: IconButton(
//         tooltip: 'Сообщение',
//         icon: const Icon(
//           LineIcons.envelope,
//           size: 24.0,
//           // color: Theme.of(context).textTheme.bodyText1!.color,
//         ),
//         onPressed: () {
//           if (!_messageController.isMessage.value) {
//             Get.defaultDialog(
//               title: 'Сообщения',
//               content: const Text('У вас нет новых сообщений'),
//             );
//           }
//         },
//       ),
//     ),
//     );
//   }
// }
