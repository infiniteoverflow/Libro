import 'package:book_donation/Utils/Styles.dart';
import 'package:book_donation/Screens/intro_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'Screens/Login_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'Models/preferences.dart';
import 'package:book_donation/Screens/email_verification_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Saves the HiveDB in the same directory as the app
  final appDocDir = await path_provider.getApplicationDocumentsDirectory();

  // Initialising HiveDB
  Hive.init(appDocDir.path);
  Hive.registerAdapter<Preferences>(PreferencesAdapter());

  await Hive.openBox('preferences');

  runApp(MyApp());
  Firebase.initializeApp(); // Initialize the Firebase App
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Box firstTimeBox;

  @override
  Widget build(BuildContext context) {
    return WatchBoxBuilder(
        box: Hive.box('preferences'),
        builder: (context, box) {
          Preferences preferences =
              box.get(0, defaultValue: Preferences(firstTime: true));
          return MaterialApp(
            title: 'Book Donation App',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Styles.colorCustom,
            ),
            home: (preferences.firstTime) ? Introduction() : LoginPage(),
            //  home: EmailVerificationScreen(),
          );
        });
  }
}
