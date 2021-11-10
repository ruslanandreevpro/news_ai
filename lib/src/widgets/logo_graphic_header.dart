import 'package:flutter/material.dart';

class LogoGraphicHeader extends StatelessWidget {
  final double size;

  LogoGraphicHeader({required this.size});

  @override
  Widget build(BuildContext context) {
    String _imageLogo = 'assets/images/default_dark_avatar.png';
    // if (Theme.of(context).brightness.toString() == 'Brightness.dark') {
    //   _imageLogo = 'assets/images/default_dark_avatar.png';
    // }
    return CircleAvatar(
      foregroundColor: Colors.blue,
      backgroundColor: Colors.transparent,
      radius: size,
      child: ClipOval(
        child: Image.asset(
          _imageLogo,
          fit: BoxFit.cover,
          width: size * 2,
          height: size * 2,
        ),
      ),
    );
  }
}