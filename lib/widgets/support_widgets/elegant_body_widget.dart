import 'package:flutter/material.dart';

class ElegantBodyWidget {
  final Text titleText;
  final Text bodyText;
  ElegantBodyWidget({
    required this.bodyText,
    required this.titleText,
  });
  Text getTitle() {
    return titleText;
  }

  Text getBodyText() {
    return bodyText;
  }
}
