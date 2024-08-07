import 'package:elegant_alert_dialog/resources/colors.dart';
import 'package:elegant_alert_dialog/widgets/dialogs_widgets/delete_elegant_alert.dart';
import 'package:elegant_alert_dialog/widgets/dialogs_widgets/info_elegant_alert.dart';
import 'package:elegant_alert_dialog/widgets/dialogs_widgets/multi_action_elegant_alert.dart';
import 'package:elegant_alert_dialog/widgets/dialogs_widgets/permission_elegant_alert.dart';
import 'package:elegant_alert_dialog/widgets/support_widgets/elegant_body_widget.dart';
import 'package:flutter/material.dart';

sealed class ElegantAlertType {
  final ElegantBodyWidget alertContent;
  final double borderRadius;

  ElegantAlertType(
    this.alertContent,
    this.borderRadius,
  );

  Widget build();

  Color get primaryColor;
}

class ElegantAlertMultiActionsType extends ElegantAlertType {
  final String primaryActionText;
  final String secondaryActionText;
  final String customActionText;

  final void Function()? onPrimaryButtonPressed;
  final void Function()? onSecondaryButtonPressed;
  final void Function()? onCustomButtonPressed;

  final Color primaryButtonColor;
  final Color secondaryButtonColor;
  final Color customButtonColor;

  ElegantAlertMultiActionsType(
    super.alertContent,
    super.borderRadius, {
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

  @override
  Color get primaryColor => multiActionColor;
}

class ElegantAlertPermissionType extends ElegantAlertType {
  final String allowButtonText;
  final String denyButtonText;

  final void Function()? onAllowButtonPressed;
  final void Function()? onDenyButtonPressed;

  final Color allowButtonColor;
  final Color denyButtonColor;

  ElegantAlertPermissionType(
    super.alertContent,
    super.borderRadius, {
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

  @override
  Color get primaryColor => permissionColor;
}

class ElegantAlertDeleteType extends ElegantAlertType {
  final String deleteButtonText;
  final String cancelButtonText;

  final void Function()? onDeletePressed;
  final void Function()? onCancelPressed;

  final Color deleteButtonColor;
  final Color cancelButtonColor;

  ElegantAlertDeleteType(
    super.alertContent,
    super.borderRadius, {
    required this.onDeletePressed,
    required this.deleteButtonText,
    required this.onCancelPressed,
    required this.cancelButtonText,
    required this.deleteButtonColor,
    required this.cancelButtonColor,
  });

  @override
  Widget build() {
    return DeleteElegantAlert(elegantAlertDeleteType: this);
  }

  @override
  Color get primaryColor => errorColor;
}

class ElegantAlertInfoType extends ElegantAlertType {
  final String confirmButtonText;
  final void Function()? confirmButtonPressed;
  final Color confirmButtonColor;

  ElegantAlertInfoType(
    super.alertContent,
    super.borderRadius, {
    required this.confirmButtonPressed,
    required this.confirmButtonText,
    required this.confirmButtonColor,
  });

  @override
  Widget build() {
    return InfoElegantAlert(elegantAlertInfoType: this);
  }

  @override
  Color get primaryColor => infoColor;
}
