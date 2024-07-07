import 'package:elegant_alert_dialog/resources/colors.dart';
import 'package:elegant_alert_dialog/widgets/support_widgets/elegant_notification_type.dart';
import 'package:flutter/material.dart';

class InfoElegantAlert extends StatelessWidget {
  final ElegantAlertInfoType elegantAlertInfoType;

  const InfoElegantAlert({
    super.key,
    required this.elegantAlertInfoType,
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
                  color: infoColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(elegantAlertInfoType.borderRadius),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            elegantAlertInfoType.alertContent.titleWidget,
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              children: [
                elegantAlertInfoType.alertContent.bodyWidget,
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          if (elegantAlertInfoType.confirmButtonPressed !=
                              null) {
                            elegantAlertInfoType.confirmButtonPressed!();
                            Navigator.of(context).pop();
                          } else {
                            Navigator.of(context).pop();
                          }
                        },
                        child: Text(
                          elegantAlertInfoType.confirmButtonText,
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
