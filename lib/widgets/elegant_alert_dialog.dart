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
    this.backgroundColor = Colors.white,
    this.radius = 0,
    this.borderColor,
    this.actions = const [],
    this.dialogShadowColor,
    this.dialogElevation = 8,
    this.animationType = AnimationTypes.scaleAnimation,
    this.animationCurve = Curves.ease,
    this.animationDuration = const Duration(
      seconds: 1,
    ),
  });

  ElegantAlertDialog.multiActions({
    super.key,
    required this.body,
    required this.confirmButtonText,
    required this.secondButtonText,
    required this.cancelButtonText,
    this.confirmButtonColor = Colors.blue,
    this.secondButtonColor = Colors.grey,
    this.cancelButtonColor = Colors.green,
    this.onConfirmButtonPressed,
    this.onSecondaryButtonPressed,
    this.onCancelPressed,
    this.animationType = AnimationTypes.scaleAnimation,
    this.animationCurve = Curves.ease,
    this.animationDuration = const Duration(
      seconds: 1,
    ),
  }) {
    borderColor = multiActionColor;
    backgroundColor = Colors.white;
    radius = 5;
    elegantAlertType = ElegantAlertMultiActionsType(
      primaryActionText: confirmButtonText!,
      secondaryActionText: secondButtonText!,
      customActionText: cancelButtonText!,
      primaryButtonColor: confirmButtonColor!,
      secondaryButtonColor: secondButtonColor!,
      customButtonColor: cancelButtonColor!,
      onPrimaryButtonPressed: onConfirmButtonPressed,
      onSecondaryButtonPressed: onSecondaryButtonPressed,
      onCustomButtonPressed: onCancelPressed,
      body: body,
    );
  }

  ElegantAlertDialog.permission({
    super.key,
    required this.body,
    required this.confirmButtonText,
    required this.cancelButtonText,
    this.onConfirmButtonPressed,
    this.onCancelPressed,
    this.confirmButtonColor = Colors.blue,
    this.cancelButtonColor = Colors.grey,
    this.animationType = AnimationTypes.scaleAnimation,
    this.animationCurve = Curves.ease,
    this.animationDuration = const Duration(
      seconds: 1,
    ),
  }) {
    borderColor = permissionColor;
    backgroundColor = Colors.white;
    radius = 5;
    elegantAlertType = ElegantAlertPermissionType(
      allowButtonText: confirmButtonText!,
      denyButtonText: cancelButtonText!,
      allowButtonColor: confirmButtonColor!,
      denyButtonColor: cancelButtonColor!,
      onAllowButtonPressed: onConfirmButtonPressed,
      onDenyButtonPressed: onCancelPressed,
      body: body,
    );
  }

  ElegantAlertDialog.caution({
    super.key,
    required this.body,
    required this.confirmButtonText,
    required this.cancelButtonText,
    this.onConfirmButtonPressed,
    this.onCancelPressed,
    this.confirmButtonColor = Colors.blue,
    this.cancelButtonColor = Colors.grey,
    this.animationType = AnimationTypes.scaleAnimation,
    this.animationCurve = Curves.ease,
    this.animationDuration = const Duration(
      seconds: 1,
    ),
  }) {
    borderColor = errorColor;
    backgroundColor = Colors.white;
    radius = 5;
    elegantAlertType = ElegantAlertDeleteType(
      cancelButtonColor: cancelButtonColor!,
      cancelButtonText: cancelButtonText!,
      onCancelPressed: onCancelPressed,
      deleteButtonColor: confirmButtonColor!,
      deleteButtonText: confirmButtonText!,
      onDeletePressed: onConfirmButtonPressed,
      body: body,
    );
  }

  ElegantAlertDialog.info({
    super.key,
    required this.body,
    required this.confirmButtonText,
    this.confirmButtonColor = Colors.blue,
    this.onConfirmButtonPressed,
    this.animationType = AnimationTypes.scaleAnimation,
    this.animationCurve = Curves.ease,
    this.animationDuration = const Duration(
      seconds: 1,
    ),
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

  final ElegantBodyWidget? body;
  late Color backgroundColor;
  late Color? borderColor;
  late double radius;
  late List<Widget> actions;
  List<BoxShadow>? dialogShadowColor;
  double? dialogElevation;

  String? secondButtonText;
  Function()? onSecondaryButtonPressed;
  Color? secondButtonColor;

  //! info constructor
  String? confirmButtonText;
  Function()? onConfirmButtonPressed;
  Color? confirmButtonColor;

  //! delete constructor
  String? cancelButtonText;
  void Function()? onCancelPressed;
  Color? cancelButtonColor;

  late ElegantAlertType? elegantAlertType;
  late AnimationTypes animationType;

  final Curve animationCurve;
  final Duration animationDuration;

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

class _ElegantAlertDialogState<T> extends State<ElegantAlertDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<dynamic> offsetAnimation;
  late Tween<dynamic> animationTween;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    )..addListener(() {
        setState(() {});
      });
    if (widget.animationType == AnimationTypes.scaleAnimation) {
      animationTween = Tween<double>(
        begin: 0.0,
        end: 1.0,
      );
    } else {
      animationTween = Tween<Offset>(
        begin: const Offset(2, 0),
        end: const Offset(0, 0),
      );
    }
    offsetAnimation = animationTween.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastEaseInToSlowEaseOut,
      ),
    );

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => animate());
  }

  void animate() {
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.animationType == AnimationTypes.scaleAnimation) {
      return Transform.scale(
        scale: offsetAnimation.value,
        child: renderElegantAlert(),
      );
    } else {
      return SlideTransition(
        position: offsetAnimation as Animation<Offset>,
        child: renderElegantAlert(),
      );
    }
  }

  Widget renderElegantAlert() {
    return Container(
      height: 250, //TODO check this hard coded value
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
