import 'package:flutter/material.dart';
import 'package:news_ai/src/widgets/widgets.dart';

class Avatar extends StatelessWidget {
  final String photoUrl;
  final double size;

  Avatar({
    required this.photoUrl,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    if (photoUrl == '') {
      return LogoGraphicHeader(size: size);
    }
    return Stack(
      children: [
        CircleAvatar(
          radius: size,
          child: ClipOval(
            child: Image.network(
              photoUrl,
              fit: BoxFit.cover,
              width: size * 2,
              height: size * 2,
            ),
          ),
        ),
      ],
    );
  }
}