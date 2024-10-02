import 'package:flutter/material.dart';

class CarouselItemModel {
  final Widget Function(BuildContext) text;
  final Widget image;

  CarouselItemModel({
    required this.text,
    required this.image,
  });
}
