import 'package:elegant_alert_dialog/elegant_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Permission Elegant Alert Dialog', () {
    testWidgets('Basic Permission alert', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: ElegantAlertDialog.permission(
            alertContent: ElegantBodyWidget(
              bodyWidget: Text("Content message"),
              titleWidget: Text(
                "Content title",
              ),
            ),
            confirmButtonText: 'Confirm',
            cancelButtonText: 'Cancel',
          ),
        ),
      ));

      expect(find.byType(ElegantAlertDialog), findsNWidgets(1));
      expect(find.byType(Text), findsNWidgets(4));
      expect(find.byType(ElevatedButton), findsNWidgets(1));
      expect(find.byType(TextButton), findsNWidgets(1));
    });
  });
}
