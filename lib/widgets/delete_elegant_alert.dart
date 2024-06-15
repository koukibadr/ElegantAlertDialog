import 'package:elegant_alert_dialog/resources/colors.dart';
import 'package:elegant_alert_dialog/resources/elegant_notification_type.dart';
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
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          elegantAlertDeleteType.cancelButtonText,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
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
