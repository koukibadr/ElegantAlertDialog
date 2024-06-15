import 'package:elegant_alert_dialog/widgets/multi_action_elegant_alert.dart';
import 'package:elegant_alert_dialog/widgets/permission_elegant_alert.dart';
import 'package:flutter/material.dart';

sealed class ElegantAlertType {
  Widget build();
}

class ElegantAlertMultiActions extends ElegantAlertType {
  ///! add documentation
  final String primaryActionText;
  final String secondaryActionText;
  final String customActionText;

  final Function()? onPrimaryButtonPressed;
  final Function()? onSecondaryButtonPressed;
  final Function()? onCustomButtonPressed;

  final Color primaryButtonColor;
  final Color secondaryButtonColor;
  final Color customButtonColor;

  ElegantAlertMultiActions({
    required this.primaryActionText,
    required this.secondaryActionText,
    required this.customActionText,
    this.onPrimaryButtonPressed,
    this.onSecondaryButtonPressed,
    this.onCustomButtonPressed,
    required this.primaryButtonColor,
    required this.secondaryButtonColor,
    required this.customButtonColor,
  });
  List<Widget> actions = [];

  @override
  Widget build() {
    return MultiActionElegantAlert(
      elegantNotificationMultiActions: this,
    );
  }
}

class ElegantAlertPermission extends ElegantAlertType {
  final String primaryButtonText;
  final String secondaryButtonText;

  final Function()? onPrimaryButtonPressed;
  final Function()? onSecondaryButtonPressed;

  final Color primaryButtonColor;
  final Color secondaryButtonColor;

  ElegantAlertPermission({
    required this.onPrimaryButtonPressed,
    required this.primaryButtonText,
    required this.onSecondaryButtonPressed,
    required this.secondaryButtonText,
    required this.primaryButtonColor,
    required this.secondaryButtonColor,
  });

  @override
  Widget build() {
    return PermissonElegantAlert(
      elegantAlertPermission: this,
    );
  }
}

class ElegantAlertDelete extends ElegantAlertType {
  final String deleteButtonText;
  final String cancelButtonText;

  final Function() onDeletePressed;
  final Function()? onCancelPressed;

  final Color deleteButtonColor;
  final Color cancelButtonColor;

  ElegantAlertDelete({
    required this.onDeletePressed,
    required this.deleteButtonText,
    this.onCancelPressed,
    required this.cancelButtonText,
    required this.deleteButtonColor,
    required this.cancelButtonColor,
  });

  @override
  Widget build() {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class ElegantAlertInfo extends ElegantAlertType {
  final String confirmButtonText;
  final Function() confirmButtonPressed;
  final Color confirmButtonColor;

  ElegantAlertInfo({
    required this.confirmButtonPressed,
    required this.confirmButtonText,
    required this.confirmButtonColor,
  });

  @override
  Widget build() {
    // TODO: implement build
    throw UnimplementedError();
  }
}
