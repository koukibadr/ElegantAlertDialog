import 'package:elegant_alert_dialog/widgets/support_widgets/elegant_notification_type.dart';
import 'package:flutter/material.dart';

class ElegantAlertContent extends StatelessWidget {
  final ElegantAlertType elegantAlertType;

  const ElegantAlertContent({
    super.key,
    required this.elegantAlertType,
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
                  color: elegantAlertType.primaryColor,
                  borderRadius: const BorderRadius.only(
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
       const Expanded(
          child: Padding(
            padding:  EdgeInsets.symmetric(
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
                    children: [],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> listOfActions() {
    if (elegantAlertType is ElegantAlertMultiActionsType) {
      var elegantType = elegantAlertType as ElegantAlertMultiActionsType;
      return [
        TextButton(
          onPressed: () {},
          child: Text(elegantType.customActionText),
        ),
        TextButton(
          onPressed: () {},
          child: Text(elegantType.secondaryActionText),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text(elegantType.primaryActionText),
        ),
      ];
    } else if (elegantAlertType is ElegantAlertPermissionType) {}
    return [];
  }
}
