import 'package:elegant_alert_dialog/widgets/elegant_alert_dialog.dart';
import 'package:flutter/material.dart';

class CustomElegantAlert extends StatelessWidget {
  final ElegantAlertDialog elegantAlertDialog;

  const CustomElegantAlert({
    super.key,
    required this.elegantAlertDialog,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 10,
                height: 40,
                decoration: BoxDecoration(
                  color: elegantAlertDialog.borderColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      elegantAlertDialog.borderRadius,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            elegantAlertDialog.alertContent.titleWidget,
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              children: [
                elegantAlertDialog.alertContent.bodyWidget,
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: elegantAlertDialog.actions,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
