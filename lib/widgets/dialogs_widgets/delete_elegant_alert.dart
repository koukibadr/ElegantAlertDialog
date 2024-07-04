import 'package:elegant_alert_dialog/resources/colors.dart';
import 'package:elegant_alert_dialog/widgets/support_widgets/elegant_notification_type.dart';
import 'package:flutter/material.dart';

class DeleteElegantAlert extends StatelessWidget {
  final ElegantAlertDeleteType elegantAlertDeleteType;

  const DeleteElegantAlert({
    super.key,
    required this.elegantAlertDeleteType,
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
                decoration: const BoxDecoration(
                  color: errorColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            elegantAlertDeleteType.alertContent.titleText,
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              children: [
                elegantAlertDeleteType.alertContent.bodyText,
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          if (elegantAlertDeleteType.onCancelPressed != null) {
                            elegantAlertDeleteType.onCancelPressed!();
                            Navigator.of(context).pop();
                          } else {
                            Navigator.of(context).pop();
                          }
                        },
                        child: Text(
                          elegantAlertDeleteType.cancelButtonText,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (elegantAlertDeleteType.onDeletePressed != null) {
                            elegantAlertDeleteType.onDeletePressed!();
                            Navigator.of(context).pop();
                          } else {
                            Navigator.of(context).pop();
                          }
                        },
                        child: Text(
                          elegantAlertDeleteType.deleteButtonText,
                        ),
                      ),
                    ],
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
