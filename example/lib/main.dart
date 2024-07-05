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
                maximumSize: const Size(
                  100,
                  100,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                ElegantAlertDialog.info(
                  height: 200,
                  withAnimation: false,
                  confirmButtonText: 'Confirm',
                  alertContent: ElegantBodyWidget(
                    titleText: const Text(
                      "Account updated",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    bodyText: const Text(
                      """We've made some improvements to your account to enhance your experience.
For more information, please visit our Help Center.""",
                    ),
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
                      "Are you sure you want to delete?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    bodyText: const Text.rich(
                      TextSpan(
                          text: "This action cannot be undone",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                                text:
                                    " selected data will be permanently deleted from your device.",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                ))
                          ]),
                    ),
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
                  height: 200,
                  alertContent: ElegantBodyWidget(
                    titleText: const Row(
                      children: [
                        Icon(Icons.camera),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Access Camera',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    bodyText: const Text(
                      "Allow App to take pictures and videos. Capture memorable moments and share them with friends!",
                    ),
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
                  height: 180,
                  alertContent: ElegantBodyWidget(
                    titleText: const Text(
                      "Access to contact",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    bodyText: const Text(
                      "Allow App to access your contact, this will let app synchronize all your friends with your contact list.",
                    ),
                  ),
                  confirmButtonText: 'Allow',
                  secondButtonText: 'Deny',
                  cancelButtonText: 'Learn More',
                  animationType: AnimationTypes.slideAnimation,
                  backgroundColor: Colors.white,
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
                  borderColor: Colors.brown,
                  borderRadius: 0,
                  backgroundColor: Colors.white.withOpacity(0.8),
                  alertContent: ElegantBodyWidget(
                    titleText: const Text(
                      "Your contact list is up to date",
                      style: TextStyle(
                        color: Colors.brown,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    bodyText: const Text(
                      "App has been updating all your contact list, now you can use your app with the latest features",
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Close',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
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
