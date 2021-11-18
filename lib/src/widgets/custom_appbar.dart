import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final String title;

  const CustomAppBar({
    Key? key,
    required this.scaffoldKey,
    required this.title,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size(double.infinity, 56.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: false,
      leading: IconButton(
        icon: const Icon(LineIcons.bars),
        onPressed: () => scaffoldKey.currentState!.openDrawer(),
      ),
      actions: const [
        // Notifications(),
        // Messages(),
        // AccountMenu(),
        // const SizedBox(width: 8.0,),
      ],
    );
  }
}
