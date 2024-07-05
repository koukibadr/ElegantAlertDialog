// ignore_for_file: must_be_immutable

import 'package:elegant_alert_dialog/resources/arrays.dart';
import 'package:elegant_alert_dialog/resources/colors.dart';
import 'package:elegant_alert_dialog/widgets/dialogs_widgets/custom_elegant_alert.dart';
import 'package:elegant_alert_dialog/widgets/support_widgets/elegant_body_widget.dart';
import 'package:elegant_alert_dialog/widgets/support_widgets/elegant_notification_type.dart';
import 'package:flutter/material.dart';

class ElegantAlertDialog extends StatefulWidget {
  ElegantAlertDialog({
    super.key,
    required this.alertContent,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.blue,
    this.actions = const [],
    this.dialogShadow,
    this.animationType = AnimationTypes.scaleAnimation,
    this.animationCurve = Curves.ease,
    this.animationDuration = const Duration(
      seconds: 1,
    ),
    this.barrierDismissable = true,
    this.height = 150,
    this.borderRadius = 10,
    this.borderSize = 1,
    this.withAnimation = true,
  });

  ElegantAlertDialog.multiActions({
    super.key,
    required this.alertContent,
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
    this.dialogShadow,
    this.barrierDismissable = true,
    this.height = 150,
    this.borderRadius = 10,
    this.borderSize = 1,
    this.withAnimation = true,
  }) {
    elegantAlertType = ElegantAlertMultiActionsType(
      alertContent,
      borderRadius,
      primaryActionText: confirmButtonText!,
      secondaryActionText: secondButtonText!,
      customActionText: cancelButtonText!,
      primaryButtonColor: confirmButtonColor!,
      secondaryButtonColor: secondButtonColor!,
      customButtonColor: cancelButtonColor!,
      onPrimaryButtonPressed: onConfirmButtonPressed,
      onSecondaryButtonPressed: onSecondaryButtonPressed,
      onCustomButtonPressed: onCancelPressed,
    );
  }

  ElegantAlertDialog.permission({
    super.key,
    required this.alertContent,
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
    this.dialogShadow,
    this.barrierDismissable = true,
    this.height = 150,
    this.borderRadius = 10,
    this.borderSize = 1,
    this.withAnimation = true,
  }) {
    elegantAlertType = ElegantAlertPermissionType(
      alertContent,
      borderRadius,
      allowButtonText: confirmButtonText!,
      denyButtonText: cancelButtonText!,
      allowButtonColor: confirmButtonColor!,
      denyButtonColor: cancelButtonColor!,
      onAllowButtonPressed: onConfirmButtonPressed,
      onDenyButtonPressed: onCancelPressed,
    );
  }

  ElegantAlertDialog.caution({
    super.key,
    required this.alertContent,
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
    this.dialogShadow,
    this.barrierDismissable = true,
    this.height = 150,
    this.borderRadius = 10,
    this.borderSize = 1,
    this.withAnimation = true,
  }) {
    elegantAlertType = ElegantAlertDeleteType(
      alertContent,
      borderRadius,
      cancelButtonColor: cancelButtonColor!,
      cancelButtonText: cancelButtonText!,
      onCancelPressed: onCancelPressed,
      deleteButtonColor: confirmButtonColor!,
      deleteButtonText: confirmButtonText!,
      onDeletePressed: onConfirmButtonPressed,
    );
  }

  ElegantAlertDialog.info({
    super.key,
    required this.alertContent,
    required this.confirmButtonText,
    this.confirmButtonColor = Colors.blue,
    this.onConfirmButtonPressed,
    this.animationType = AnimationTypes.scaleAnimation,
    this.animationCurve = Curves.ease,
    this.animationDuration = const Duration(
      seconds: 1,
    ),
    this.backgroundColor = Colors.white,
    this.dialogShadow,
    this.barrierDismissable = true,
    this.height = 150,
    this.borderRadius = 10,
    this.borderSize = 1,
    this.withAnimation = true,
  }) {
    elegantAlertType = ElegantAlertInfoType(
      alertContent,
      borderRadius,
      confirmButtonColor: confirmButtonColor!,
      confirmButtonPressed: onConfirmButtonPressed,
      confirmButtonText: confirmButtonText!,
    );
  }

  ///Alert content widget, it's required in all constructors
  ///[ElegantBodyWidget] contain two attributes [title] and [description] of type widgets
  ///both are required
  final ElegantBodyWidget alertContent;

  ///The alert dialog background color, by default alert is white
  ///it's used to render the alert content widget
  final Color backgroundColor;

  ///list of shadows applied to the alert dialog
  ///by default [dialogShadow] is null and a default shadow is applied
  ///
  ///if you want to remove shadow pass an empty list in [dialogShadow]
  final List<BoxShadow>? dialogShadow;

  ///the type of animation rendered
  ///[AnimationTypes.slideAnimation] to render a scale animation using [SlideTransition]
  ///[AnimationTypes.scaleAnimation] to show an animation using [Transform.scale]
  ///
  ///[animationCurve] is used to set the animation curve
  ///[animationDuration] is the animation duration of type [Duration]
  final AnimationTypes animationType;

  ///the animation curve used to render the animation
  ///by default its [Curves.ease]
  final Curve animationCurve;

  ///The animation duration of being rendered
  ///the default duration is set to one second
  final Duration animationDuration;

  ///indicate whether the barrier is dismissable or not
  ///by default {barrierDismissable == true}
  final bool barrierDismissable;

  ///the alert dialog height
  final double height;

  ///the alert dialog border radius
  final double borderRadius;

  ///the alert dialog border size
  final double borderSize;

  ///indicate whether the animation will be displayed when showing the alert
  ///by default [withAnimation == true]
  final bool withAnimation;

  ///The alert border color
  late Color? borderColor;

  ///the list of actions (widgets) that will be rendered as buttons
  ///required when using [custom] constructor
  late List<Widget> actions;

  ///The main button text
  ///[multiActions] constructor is the primaryActionButton
  ///[permission] is the allowButton text
  ///[caution] is the delete button text
  ///[info] is the confirmation button text
  late String? confirmButtonText;

  ///A secondary main button, displayed only when using [multiActions] constructor
  ///[multiActions] constructor is the primaryActionButton
  late String? secondButtonText;

  ///The cancel button text
  ///[multiActions] the cancel button text
  ///[permission] the deny button text
  ///[caution] the cancel button text
  late String? cancelButtonText;

  ///The main button callback action
  ///[multiActions] primary button callback action
  ///[permission] the allow button action callback
  ///[caution] the delete button action callback
  ///[info] the confirmation button action callback
  late Function()? onConfirmButtonPressed;

  ///A secondary main button, displayed only when using [multiActions] constructor
  /// the action callback will be called when pressing the secondary main button
  late Function()? onSecondaryButtonPressed;

  ///The cancel button action callback
  ///[multiActions] and [caution] constructors is the cancel button
  ///[permission] the deny button
  late Function()? onCancelPressed;

  ///The main button color
  ///[multiActions] constructor is the primary button
  ///[permission] constructor is  the allowButton
  ///[caution] constructor is  the delete button
  ///[info] constructor is  the confirmation button
  late Color? confirmButtonColor;

  ///A secondary main button, displayed only when using [multiActions] constructor
  ///the color in which the secondary button is rendered
  late Color? secondButtonColor;

  ///The cancel button color
  ///[multiActions] and [caution] constructors the cancel button
  ///[permission] the deny button text
  late Color? cancelButtonColor;

  ElegantAlertType? elegantAlertType;

  void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissable,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
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
    if (widget.withAnimation) {
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
      WidgetsBinding.instance.addPostFrameCallback((_) => animate());
    }
    if (widget.elegantAlertType != null) {
      widget.borderColor = widget.elegantAlertType?.primaryColor;
    }
    super.initState();
  }

  void animate() {
    _animationController.forward();
  }

  @override
  void dispose() {
    if (widget.withAnimation) {
      _animationController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.withAnimation) {
      return renderElegantAlert();
    } else if (widget.animationType == AnimationTypes.scaleAnimation) {
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
      height: widget.height,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(
          widget.borderRadius,
        ),
        boxShadow: widget.dialogShadow ??
            const [
              BoxShadow(
                color: dialogShadowColorConst,
                blurRadius: 0.5,
                spreadRadius: 0.5,
                blurStyle: BlurStyle.outer,
              )
            ],
        border: Border.all(
          width: widget.borderSize,
          color: widget.borderColor ??
              widget.elegantAlertType?.primaryColor ??
              Colors.blue,
        ),
      ),
      child: widget.elegantAlertType == null
          ? CustomElegantAlert(
              elegantAlertDialog: widget,
            )
          : widget.elegantAlertType?.build(),
    );
  }
}
