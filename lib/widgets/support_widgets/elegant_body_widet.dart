import 'package:flutter/material.dart';

class ElegantBody {
  final Text titleText;
  final Text bodyText;
  ElegantBody({
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
