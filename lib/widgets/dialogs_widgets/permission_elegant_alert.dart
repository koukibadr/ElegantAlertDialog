import 'package:elegant_alert_dialog/resources/colors.dart';
import 'package:elegant_alert_dialog/widgets/support_widgets/elegant_notification_type.dart';
import 'package:flutter/material.dart';

class PermissonElegantAlert extends StatelessWidget {
  final ElegantAlertPermissionType elegantAlertPermission;

  const PermissonElegantAlert({
    super.key,
    required this.elegantAlertPermission,
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
                  color: permissionColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            elegantAlertPermission.alertContent.titleText,
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              children: [
                elegantAlertPermission.alertContent.bodyText,
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      //TODO refactor buttons with other alert types
                      TextButton(
                        onPressed: () {
                          if (elegantAlertPermission.onDenyButtonPressed !=
                              null) {
                            elegantAlertPermission.onDenyButtonPressed!();
                            Navigator.of(context).pop();
                          } else {
                            Navigator.of(context).pop();
                          }
                        },
                        child: Text(elegantAlertPermission.denyButtonText),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (elegantAlertPermission.onAllowButtonPressed !=
                              null) {
                            elegantAlertPermission.onAllowButtonPressed!();
                            Navigator.of(context).pop();
                          } else {
                            Navigator.of(context).pop();
                          }
                        },
                        child: Text(elegantAlertPermission.allowButtonText),
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
