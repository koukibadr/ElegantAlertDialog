// ignore_for_file: must_be_immutable

import 'package:elegant_alert_dialog/resources/arrays.dart';
import 'package:elegant_alert_dialog/resources/colors.dart';
import 'package:elegant_alert_dialog/widgets/support_widgets/elegant_body_widget.dart';
import 'package:elegant_alert_dialog/widgets/support_widgets/elegant_notification_type.dart';
import 'package:flutter/material.dart';

class ElegantAlertDialog extends StatefulWidget {
  ElegantAlertDialog({
    super.key,
    this.body,
    this.title,
    this.backgroundColor = Colors.white,
    this.radius = 0,
    this.borderColor,
    this.actions = const [],
    this.dialogShadowColor,
    this.dialogElevation = 8,
    this.animationType = AnimationTypes.scaleAnimation,
  });

  ElegantAlertDialog.multiActions({
    super.key,
    required this.body,
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
    this.animationType = AnimationTypes.scaleAnimation,
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
      body: body,
    );
  }

  ElegantAlertDialog.permission({
    super.key,
    this.body,
    this.title,
    this.allowButtonColor = Colors.blue,
    this.allowButtonText = 'Confirm',
    this.onAllowButtonPressed,
    this.denyButtonColor = Colors.grey,
    this.denyButtonText = 'Learn more',
    this.onDenyButtonPressed,
    this.animationType = AnimationTypes.scaleAnimation,
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
      body: body,
    );
  }

  ElegantAlertDialog.caution({
    super.key,
    this.body,
    this.title,
    this.deleteButtonColor = Colors.blue,
    this.deleteButtonText = 'Confirm',
    required this.onDeletePressed,
    this.cancelButtonColor = Colors.grey,
    this.cancelButtonText = 'Learn more',
    this.onCancelPressed,
    this.animationType = AnimationTypes.scaleAnimation,
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
      body: body,
    );
  }

  ElegantAlertDialog.info({
    super.key,
    required this.body,
    this.title,
    this.confirmButtonColor = Colors.blue,
    this.confirmButtonText = 'Confirm',
    this.onConfirmButtonPressed,
    this.animationType = AnimationTypes.scaleAnimation,
  }) {
    borderColor = infoColor;
    backgroundColor = Colors.white;
    radius = 5;
    elegantAlertType = ElegantAlertInfoType(
      confirmButtonColor: confirmButtonColor!,
      confirmButtonPressed: onConfirmButtonPressed,
      confirmButtonText: confirmButtonText!,
      body: body,
    );
  }

  final Widget? title;
  final ElegantBodyWidget? body;
  late Color backgroundColor;
  late Color? borderColor;
  late double radius;
  late List<Widget> actions;
  List<BoxShadow>? dialogShadowColor;
  double? dialogElevation;

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

  void Function()? onDeletePressed;
  void Function()? onCancelPressed;

  Color? deleteButtonColor;
  Color? cancelButtonColor;

  late ElegantAlertType? elegantAlertType;
  late AnimationTypes animationType;

  void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          elevation: dialogElevation,
          backgroundColor: Colors.transparent,
          insetAnimationDuration: const Duration(
            milliseconds: 800,
          ),
          insetAnimationCurve: Curves.fastEaseInToSlowEaseOut,
          child: this,
        );
      },
    );
  }

  @override
  State<ElegantAlertDialog> createState() => _ElegantAlertDialogState();
}

class _ElegantAlertDialogState extends State<ElegantAlertDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<Offset> offsetAnimation;
  late AnimationController slideController;

  late Animation<double> _popUpTween;

  @override
  void initState() {
    if (widget.animationType == AnimationTypes.scaleAnimation) {
      _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 800),
      )..addListener(() {
          setState(() {});
        });
      _popUpTween = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Curves.fastEaseInToSlowEaseOut,
        ),
      );
    } else {
      slideController = AnimationController(
        duration: const Duration(seconds: 2),
        vsync: this,
      );
      offsetAnimation = Tween<Offset>(
        begin: const Offset(2, 0),
        end: const Offset(0, 0),
      ).animate(
        CurvedAnimation(
          parent: slideController,
          curve: Curves.easeInCirc,
        ),
      );
    }

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => animate());
  }

  void animate() {
    if (widget.animationType == AnimationTypes.scaleAnimation) {
      _animationController.forward();
    } else {
      slideController.forward();
    }
  }

  @override
  void dispose() {
    if (widget.animationType == AnimationTypes.scaleAnimation) {
      _animationController.dispose();
    } else {
      slideController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.animationType == AnimationTypes.scaleAnimation) {
      return Transform.scale(
        scale: _popUpTween.value,
        child: renderElegantAlert(),
      );
    } else {
      return SlideTransition(
        position: offsetAnimation,
        child: renderElegantAlert(),
      );
    }
  }

  Widget renderElegantAlert() {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        boxShadow: widget.dialogShadowColor ??
            const [
              BoxShadow(
                color: dialogShadowColorConst,
                blurRadius: 0.5,
                spreadRadius: 0.5,
                blurStyle: BlurStyle.outer,
              )
            ],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: widget.borderColor!,
        ),
      ),
      child: widget.elegantAlertType?.build(),
    );
  }
}
