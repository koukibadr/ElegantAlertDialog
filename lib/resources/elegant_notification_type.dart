import 'package:flutter/material.dart';

sealed class ElegantNotificationType {}

class ElegantNotificationMultiActions extends ElegantNotificationType {
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

  ElegantNotificationMultiActions({
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
}

class ElegantNotificationPermission extends ElegantNotificationType {
  final String primaryButtonText;
  final String secondaryButtonText;

  final Function() onPrimaryButtonPressed;
  final Function() onSecondaryButtonPressed;

  final Color primaryButtonColor;
  final Color secondaryButtonColor;

  ElegantNotificationPermission({
    required this.onPrimaryButtonPressed,
    required this.primaryButtonText,
    required this.onSecondaryButtonPressed,
    required this.secondaryButtonText,
    required this.primaryButtonColor,
    required this.secondaryButtonColor,
  });
}

class ElegantNotificationDelete extends ElegantNotificationType {
  final String deleteButtonText;
  final String cancelButtonText;

  final Function() onDeletePressed;
  final Function()? onCancelPressed;

  final Color deleteButtonColor;
  final Color cancelButtonColor;

  ElegantNotificationDelete({
    required this.onDeletePressed,
    required this.deleteButtonText,
    this.onCancelPressed,
    required this.cancelButtonText,
    required this.deleteButtonColor,
    required this.cancelButtonColor,
  });
}

class ElegantNotificationInfo extends ElegantNotificationType {
  final String confirmButtonText;
  final Function() confirmButtonPressed;
  final Color confirmButtonColor;

  ElegantNotificationInfo({
    required this.confirmButtonPressed,
    required this.confirmButtonText,
    required this.confirmButtonColor,
  });
}
