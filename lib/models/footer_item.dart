import 'package:flutter/material.dart';

class FooterItem {
  final String iconPath;
  final String title;
  final String text1;
  final String? text2;
  final GestureTapCallback? onTap;

  FooterItem({
    required this.iconPath,
    required this.title,
    required this.text1,
    this.text2,
    this.onTap,
  });
}
