import 'package:flutter/material.dart';

class FormInputFieldWithIcon extends StatelessWidget {
  FormInputFieldWithIcon({
    required this.controller,
    required this.iconPrefix,
    required this.labelText,
    required this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.minLines = 1,
    this.maxLines,
    required this.onChanged,
    required this.onSaved
  });

  final TextEditingController controller;
  final IconData iconPrefix;
  final String labelText;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final int minLines;
  final int? maxLines;
  final void Function(String) onChanged;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: Theme.of(context).accentColor,
      ),
      decoration: InputDecoration(
        filled: false,
        prefixIcon: Icon(iconPrefix, color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.5),),
        labelText: labelText,
        labelStyle: TextStyle(
          color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.5),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.5),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.5),
          ),
        ),
      ),
      controller: controller,
      onSaved: onSaved,
      onChanged: onChanged,
      keyboardType: keyboardType,
      obscureText: obscureText,
      maxLines: maxLines,
      minLines: minLines,
      validator: validator,
    );
  }
}
