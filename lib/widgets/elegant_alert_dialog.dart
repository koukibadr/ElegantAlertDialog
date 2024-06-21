// ignore_for_file: must_be_immutable

import 'package:elegant_alert_dialog/resources/colors.dart';
import 'package:elegant_alert_dialog/widgets/support_widgets/elegant_body_widet.dart';
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
      body: body
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
      body: body
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
  final ElegantBody? body;
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

  void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          elevation: dialogElevation,
          backgroundColor: Colors.transparent,
          insetAnimationDuration: const Duration(milliseconds: 800),
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
  late Animation<double> _popUpTween;

  @override
  void initState() {
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
    return Transform.scale(
      scale: _popUpTween.value,
      child: Container(
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
      ),
    );
  }
}

// // ignore: must_be_immutable
// class ElegantAlertDialog extends StatelessWidget {
//   ElegantAlertDialog({
//     super.key,
//     required this.description,
//     this.title,
//     this.backgroundColor = Colors.white,
//     this.radius = 0,
//     this.borderColor,
//     this.actions = const [],
//     this.dialogShadowColor,
//     this.dialogElevation,
//   });

//   ElegantAlertDialog.multiActions({
//     super.key,
//     required this.description,
//     this.title,
//     this.primaryButtonColor = Colors.blue,
//     this.primaryButtonText = 'Confirm',
//     this.onPrimaryButtonPressed,
//     this.secondButtonColor = Colors.grey,
//     this.secondButtonText = 'Learn more',
//     this.onSecondaryButtonPressed,
//     this.customButtonColor = Colors.green,
//     this.customButtonText = 'Cancel',
//     this.onCustomButtonPressed,
//   }) {
//     borderColor = multiActionColor;
//     backgroundColor = Colors.white;
//     radius = 5;
//     elegantAlertType = ElegantAlertMultiActionsType(
//       primaryActionText: primaryButtonText!,
//       secondaryActionText: secondButtonText!,
//       customActionText: customButtonText!,
//       primaryButtonColor: primaryButtonColor!,
//       secondaryButtonColor: secondButtonColor!,
//       customButtonColor: customButtonColor!,
//       onPrimaryButtonPressed: onPrimaryButtonPressed,
//       onSecondaryButtonPressed: onSecondaryButtonPressed,
//       onCustomButtonPressed: onCustomButtonPressed,
//     );
//   }

//   ElegantAlertDialog.permission({
//     super.key,
//     required this.description,
//     this.title,
//     this.allowButtonColor = Colors.blue,
//     this.allowButtonText = 'Confirm',
//     this.onAllowButtonPressed,
//     this.denyButtonColor = Colors.grey,
//     this.denyButtonText = 'Learn more',
//     this.onDenyButtonPressed,
//   }) {
//     borderColor = permissionColor;
//     backgroundColor = Colors.white;
//     radius = 5;
//     elegantAlertType = ElegantAlertPermissionType(
//       allowButtonText: allowButtonText!,
//       denyButtonText: denyButtonText!,
//       allowButtonColor: allowButtonColor!,
//       denyButtonColor: denyButtonColor!,
//       onAllowButtonPressed: onAllowButtonPressed,
//       onDenyButtonPressed: onDenyButtonPressed,
//     );
//   }

//   ElegantAlertDialog.caution({
//     super.key,
//     required this.description,
//     this.title,
//     this.deleteButtonColor = Colors.blue,
//     this.deleteButtonText = 'Confirm',
//     required this.onDeletePressed,
//     this.cancelButtonColor = Colors.grey,
//     this.cancelButtonText = 'Learn more',
//     required this.onCancelPressed,
//   }) {
//     borderColor = errorColor;
//     backgroundColor = Colors.white;
//     radius = 5;
//     elegantAlertType = ElegantAlertDeleteType(
//       cancelButtonColor: cancelButtonColor!,
//       cancelButtonText: cancelButtonText!,
//       onCancelPressed: onCancelPressed,
//       deleteButtonColor: deleteButtonColor!,
//       deleteButtonText: deleteButtonText!,
//       onDeletePressed: onDeletePressed,
//     );
//   }

//   ElegantAlertDialog.info({
//     super.key,
//     required this.description,
//     this.title,
//     this.confirmButtonColor = Colors.blue,
//     this.confirmButtonText = 'Confirm',
//     this.onConfirmButtonPressed,
//   }) {
//     borderColor = infoColor;
//     backgroundColor = Colors.white;
//     radius = 5;
//     elegantAlertType = ElegantAlertInfoType(
//       confirmButtonColor: confirmButtonColor!,
//       confirmButtonPressed: onConfirmButtonPressed,
//       confirmButtonText: confirmButtonText!,
//     );
//   }

//   final Widget? title;
//   final Widget description;
//   late Color backgroundColor;
//   late Color? borderColor;
//   late double radius;
//   late List<Widget> actions;
//   Color? dialogShadowColor;
//   double? dialogElevation;

//   //! multi actions constructor
//   String? primaryButtonText;
//   String? secondButtonText;
//   String? customButtonText;

//   Function()? onPrimaryButtonPressed;
//   Function()? onSecondaryButtonPressed;
//   Function()? onCustomButtonPressed;

//   Color? primaryButtonColor;
//   Color? secondButtonColor;
//   Color? customButtonColor;

//   //! permission constructor
//   String? allowButtonText;
//   String? denyButtonText;

//   Function()? onAllowButtonPressed;
//   Function()? onDenyButtonPressed;

//   Color? allowButtonColor;
//   Color? denyButtonColor;

//   //! info constructor
//   String? confirmButtonText;
//   Function()? onConfirmButtonPressed;
//   Color? confirmButtonColor;

//   //! delete constructor
//   String? deleteButtonText;
//   String? cancelButtonText;

//   void Function()? onDeletePressed;
//   void Function()? onCancelPressed;

//   Color? deleteButtonColor;
//   Color? cancelButtonColor;

//   late ElegantAlertType? elegantAlertType;

//   void show(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return Dialog(
//           child: this,
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return PhysicalModel(
//       color: Colors.transparent,
//       shadowColor: dialogShadowColor ?? dialogShadowColorConst,
//       elevation: dialogElevation ?? 6,
//       child: Container(
//         height: 250,
//         decoration: BoxDecoration(
//           color: backgroundColor,
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(
//             width: 1,
//             color: borderColor!,
//           ),
//         ),
//         child: elegantAlertType?.build(),
//       ),
//     );
//   }
// }
