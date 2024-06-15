import 'package:elegant_alert_dialog/widgets/info_elegant_alert.dart';
import 'package:elegant_alert_dialog/widgets/multi_action_elegant_alert.dart';
import 'package:elegant_alert_dialog/widgets/permission_elegant_alert.dart';
import 'package:flutter/material.dart';

sealed class ElegantAlertType {
  Widget build();
}

class ElegantAlertMultiActionsType extends ElegantAlertType {
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

  ElegantAlertMultiActionsType({
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

class ElegantAlertPermissionType extends ElegantAlertType {
  final String allowButtonText;
  final String denyButtonText;

  final Function()? onAllowButtonPressed;
  final Function()? onDenyButtonPressed;

  final Color allowButtonColor;
  final Color denyButtonColor;

  ElegantAlertPermissionType({
    required this.onAllowButtonPressed,
    required this.allowButtonText,
    required this.onDenyButtonPressed,
    required this.denyButtonText,
    required this.allowButtonColor,
    required this.denyButtonColor,
  });

  @override
  Widget build() {
    return PermissonElegantAlert(
      elegantAlertPermission: this,
    );
  }
}

class ElegantAlertDeleteType extends ElegantAlertType {
  final String deleteButtonText;
  final String cancelButtonText;

  final Function() onDeletePressed;
  final Function()? onCancelPressed;

  final Color deleteButtonColor;
  final Color cancelButtonColor;

  ElegantAlertDeleteType({
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

class ElegantAlertInfoType extends ElegantAlertType {
  final String confirmButtonText;
  final Function()? confirmButtonPressed;
  final Color confirmButtonColor;

  ElegantAlertInfoType({
    required this.confirmButtonPressed,
    required this.confirmButtonText,
    required this.confirmButtonColor,
  });

  @override
  Widget build() {
    return InfoElegantAlert(elegantAlertInfoType: this);
  }
}
