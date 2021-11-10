import 'package:flutter/material.dart';

class PageModel {
  final String title;
  final String route;
  final Widget page;

  PageModel({
    required this.title,
    required this.route,
    required this.page,
  });
}