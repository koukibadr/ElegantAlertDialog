import 'package:elegant_alert_dialog/resources/colors.dart';
import 'package:elegant_alert_dialog/resources/elegant_notification_type.dart';
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
    this.actions = const [],
  });

  ElegantAlertDialog.multiActions({
    super.key,
    required this.description,
    this.title,
    this.primaryButtonColor = Colors.blue,
    this.primaryButtonText = 'Confirm',
    this.onPrimaryButtonPressed,
    this.secondButtonColor = Colors.grey,
    this.secondButtonText = 'Learn more',
    this.onSecondaryButtonPressed,
    this.customButtonColor = Colors.green,
    this.customButtonText = 'Cancel',
    this.onCustomButtonPressed,
  }) {
    borderColor = multiActionColor;
    backgroundColor = Colors.white;
    radius = 5;
    elegantAlertType = ElegantAlertMultiActionsType(
      primaryActionText: primaryButtonText!,
      secondaryActionText: secondButtonText!,
      customActionText: customButtonText!,
      primaryButtonColor: primaryButtonColor!,
      secondaryButtonColor: secondButtonColor!,
      customButtonColor: customButtonColor!,
      onPrimaryButtonPressed: onPrimaryButtonPressed,
      onSecondaryButtonPressed: onSecondaryButtonPressed,
      onCustomButtonPressed: onCustomButtonPressed,
    );
  }

  ElegantAlertDialog.permission({
    super.key,
    required this.description,
    this.title,
    this.allowButtonColor = Colors.blue,
    this.allowButtonText = 'Confirm',
    this.onAllowButtonPressed,
    this.denyButtonColor = Colors.grey,
    this.denyButtonText = 'Learn more',
    this.onDenyButtonPressed,
  }) {
    borderColor = permissionColor;
    backgroundColor = Colors.white;
    radius = 5;
    elegantAlertType = ElegantAlertPermissionType(
      allowButtonText: allowButtonText!,
      denyButtonText: denyButtonText!,
      allowButtonColor: allowButtonColor!,
      denyButtonColor: denyButtonColor!,
      onAllowButtonPressed: onAllowButtonPressed,
      onDenyButtonPressed: onDenyButtonPressed,
    );
  }

  ElegantAlertDialog.delete({
    super.key,
    required this.description,
    this.title,
    this.deleteButtonColor = Colors.blue,
    this.deleteButtonText = 'Confirm',
    this.onDeletePressed,
    this.cancelButtonColor = Colors.grey,
    this.cancelButtonText = 'Learn more',
    this.onCancelPressed,
  }) {
    borderColor = errorColor;
    backgroundColor = Colors.white;
    radius = 5;
    elegantAlertType = ElegantAlertDeleteType(
      cancelButtonColor: cancelButtonColor!,
      cancelButtonText: cancelButtonText!,
      onCancelPressed: onCancelPressed,
      deleteButtonColor: deleteButtonColor!,
      deleteButtonText: deleteButtonText!,
      onDeletePressed: onDeletePressed,
    );
  }

  ElegantAlertDialog.info({
    super.key,
    required this.description,
    this.title,
    this.confirmButtonColor = Colors.blue,
    this.confirmButtonText = 'Confirm',
    this.onConfirmButtonPressed,
  }) {
    borderColor = infoColor;
    backgroundColor = Colors.white;
    radius = 5;
    elegantAlertType = ElegantAlertInfoType(
      confirmButtonColor: confirmButtonColor!,
      confirmButtonPressed: onConfirmButtonPressed,
      confirmButtonText: confirmButtonText!,
    );
  }

  final Widget? title;
  final Widget description;
  late Color backgroundColor;
  late Color? borderColor;
  late double radius;
  late List<Widget> actions;

  //! multi actions constructor
  String? primaryButtonText;
  String? secondButtonText;
  String? customButtonText;

  Function()? onPrimaryButtonPressed;
  Function()? onSecondaryButtonPressed;
  Function()? onCustomButtonPressed;

  Color? primaryButtonColor;
  Color? secondButtonColor;
  Color? customButtonColor;

  //! permission constructor
  String? allowButtonText;
  String? denyButtonText;

  Function()? onAllowButtonPressed;
  Function()? onDenyButtonPressed;

  Color? allowButtonColor;
  Color? denyButtonColor;

  //! info constructor
  String? confirmButtonText;
  Function()? onConfirmButtonPressed;
  Color? confirmButtonColor;

  //! delete constructor
  String? deleteButtonText;
  String? cancelButtonText;

  Function()? onDeletePressed;
  Function()? onCancelPressed;

  Color? deleteButtonColor;
  Color? cancelButtonColor;

  late ElegantAlertType? elegantAlertType;

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
      height: 250,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: borderColor!,
        ),
      ),
      child: elegantAlertType?.build(),
    );
  }
}
