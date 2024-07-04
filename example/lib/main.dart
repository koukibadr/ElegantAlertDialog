import 'package:elegant_alert_dialog/elegant_alert_dialog.dart';
import 'package:elegant_alert_dialog/resources/arrays.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Elegant Alert Dialog'),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                maximumSize: const Size(100, 100),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                ElegantAlertDialog.info(
                  confirmButtonText: 'Confirm',
                  alertContent: ElegantBodyWidget(
                    titleText: const Text(
                      "Info",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    bodyText: const Text(
                        "This is to inform you that you are seeing Elegant Alert Dialogs."),
                  ),
                  animationType: AnimationTypes.slideAnimation,
                ).show(context);
              },
              child: const Text('Info'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                maximumSize: const Size(100, 100),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                ElegantAlertDialog.caution(
                  confirmButtonText: 'Delete',
                  cancelButtonText: 'Cancel',
                  onConfirmButtonPressed: () {},
                  alertContent: ElegantBodyWidget(
                    titleText: const Text(
                      "Wait!!!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    bodyText: const Text("your about to delete everything!"),
                  ),
                ).show(context);
              },
              child: const Text('Caution'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                maximumSize: const Size(100, 100),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                ElegantAlertDialog.permission(
                  alertContent: ElegantBodyWidget(
                    bodyText: const Text(''),
                    titleText: const Text("Alert title"),
                  ),
                  confirmButtonText: 'Allow',
                  cancelButtonText: 'Deny',
                ).show(context);
              },
              child: const Text('Permission'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                maximumSize: const Size(100, 100),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                ElegantAlertDialog.multiActions(
                  alertContent: ElegantBodyWidget(
                    titleText: const Text(
                      "Multi action alert",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    bodyText: const Text("Choose one of the following."),
                  ),
                  confirmButtonText: 'Confirm',
                  secondButtonText: 'Send',
                  cancelButtonText: 'Cancel',
                  animationType: AnimationTypes.slideAnimation,
                ).show(context);
              },
              child: const Text('Multi action'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                maximumSize: const Size(100, 100),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                ElegantAlertDialog(
                  alertContent: ElegantBodyWidget(
                    titleText: const Text(
                      "This is a cascading alert! 1",
                    ),
                    bodyText: const Text(
                      "Press confirm to see how deep it goes.",
                    ),
                  ),
                ).show(context);
              },
              child: const Text('Custom alert'),
            ),
          ],
        ),
      ),
    );
  }
}
