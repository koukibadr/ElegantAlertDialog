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
    this.borderColor = Colors.blue,
    this.actions = const [],
    this.dialogShadowColor,
    this.animationType = AnimationTypes.scaleAnimation,
    this.animationCurve = Curves.ease,
    this.animationDuration = const Duration(
      seconds: 1,
    ),
    this.barrierDismissable = true,
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
    this.backgroundColor = Colors.white,
    this.radius = 5,
    this.dialogShadowColor,
    this.barrierDismissable = true,
  }) {
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
    this.backgroundColor = Colors.white,
    this.radius = 5,
    this.dialogShadowColor,
    this.barrierDismissable = true,
  }) {
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
    this.backgroundColor = Colors.white,
    this.radius = 5,
    this.dialogShadowColor,
    this.barrierDismissable = true,
  }) {
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
    this.backgroundColor = Colors.white,
    this.radius = 5,
    this.dialogShadowColor,
    this.barrierDismissable = true,
  }) {
    elegantAlertType = ElegantAlertInfoType(
      confirmButtonColor: confirmButtonColor!,
      confirmButtonPressed: onConfirmButtonPressed,
      confirmButtonText: confirmButtonText!,
      body: body,
    );
  }

  //TODO add missing attribute documentation
  final ElegantBodyWidget? body;
  final Color backgroundColor;
  final double radius;
  final List<BoxShadow>? dialogShadowColor;
  final AnimationTypes animationType;
  final Curve animationCurve;
  final Duration animationDuration;
  final bool barrierDismissable;

  late Color? borderColor;
  late List<Widget> actions;

  late String? confirmButtonText;
  late String? secondButtonText;
  late String? cancelButtonText;

  late Function()? onConfirmButtonPressed;
  late Function()? onSecondaryButtonPressed;
  late Function()? onCancelPressed;

  late Color? confirmButtonColor;
  late Color? secondButtonColor;
  late Color? cancelButtonColor;

  late ElegantAlertType? elegantAlertType;

  void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissable,
      builder: (context) {
        return Dialog(
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

    if (widget.elegantAlertType != null) {
      widget.borderColor = widget.elegantAlertType?.primaryColor;
    }

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
          color: widget.borderColor ??
              widget.elegantAlertType?.primaryColor ??
              Colors.blue,
        ),
      ),
      child: widget.elegantAlertType?.build(),
    );
  }
}
