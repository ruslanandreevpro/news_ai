import 'package:flutter/material.dart';

class LabelButton extends StatelessWidget {
  LabelButton({required this.labelText, required this.onPressed, required this.style});
  final String labelText;
  final void Function() onPressed;
  final ButtonStyle style;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        labelText,
      ),
      onPressed: onPressed,
      style: style,
    );
  }
}
