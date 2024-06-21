import 'package:elegant_alert_dialog/resources/colors.dart';
import 'package:elegant_alert_dialog/widgets/support_widgets/elegant_notification_type.dart';
import 'package:flutter/material.dart';

class MultiActionElegantAlert extends StatelessWidget {
  final ElegantAlertMultiActionsType elegantNotificationMultiActions;

  const MultiActionElegantAlert(
      {super.key, required this.elegantNotificationMultiActions});

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
                  color: multiActionColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            elegantNotificationMultiActions.body?.getTitle() ??
                const Text(
                  'This is serious!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              children: [
                elegantNotificationMultiActions.body?.getBodyText() ??
                    const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                    ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          if (elegantNotificationMultiActions
                                  .onCustomButtonPressed !=
                              null) {
                            elegantNotificationMultiActions
                                .onCustomButtonPressed!();
                            Navigator.of(context).pop();
                          } else {
                            Navigator.of(context).pop();
                          }
                        },
                        child: Text(
                          elegantNotificationMultiActions.customActionText,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          if (elegantNotificationMultiActions
                                  .onSecondaryButtonPressed !=
                              null) {
                            elegantNotificationMultiActions
                                .onSecondaryButtonPressed!();
                            Navigator.of(context).pop();
                          } else {
                            Navigator.of(context).pop();
                          }
                        },
                        child: Text(
                          elegantNotificationMultiActions.secondaryActionText,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (elegantNotificationMultiActions
                                  .onPrimaryButtonPressed !=
                              null) {
                            elegantNotificationMultiActions
                                .onPrimaryButtonPressed!();
                            Navigator.of(context).pop();
                          } else {
                            Navigator.of(context).pop();
                          }
                        },
                        child: Text(
                          elegantNotificationMultiActions.primaryActionText,
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
