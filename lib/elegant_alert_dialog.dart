import 'package:elegant_alert_dialog/resources/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ElegantAlertDialog extends StatelessWidget {
  ElegantAlertDialog({
    super.key,
    required this.description,
    this.title,
    this.backgroundColor = Colors.white,
    this.radius = 0,
    this.borderColor,
  });

  ElegantAlertDialog.success({
    super.key,
    required this.description,
    this.title,
  }) {
    borderColor = successColor;
    backgroundColor = Colors.white;
    radius = 5;
  }

  ElegantAlertDialog.error({
    super.key,
    required this.description,
    this.title,
  }) {
    borderColor = errorColor;
    backgroundColor = Colors.white;
    radius = 5;
  }

  ElegantAlertDialog.info({
    super.key,
    required this.description,
    this.title,
  }) {
    borderColor = inforColor;
    backgroundColor = Colors.white;
    radius = 5;
  }

  final Widget? title;
  final Widget description;


  late Color backgroundColor;
  late Color? borderColor;
  late double radius;

  void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: this,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          color: borderColor ?? Colors.transparent,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            title ?? const SizedBox.shrink(),
            description,
          ],
        ),
      ),
    );
  }
}
