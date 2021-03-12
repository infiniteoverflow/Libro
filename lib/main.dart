import 'package:book_donation/Utils/Styles.dart';
import 'package:book_donation/Screens/intro_screen.dart';
import 'package:flutter/material.dart';
import 'Screens/Login_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Saves the HiveDB in the same directory as the app
  final appDocDir = await path_provider.getApplicationDocumentsDirectory();

  // Initialising HiveDB
  Hive.init(appDocDir.path);

  runApp(MyApp());
  Firebase.initializeApp(); // Initialize the Firebase App
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Box firstTimeBox;

  Future _openHiveBox() async {
    firstTimeBox = await Hive.openBox('firstTime');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Donation App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Styles.colorCustom,
      ),
      home: FutureBuilder(
        future: _openHiveBox(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              // show error
            } else {
              if (firstTimeBox.get('firstTime') == false) {
                return LoginPage();
              } else {
                firstTimeBox.put('firstTime', false);
                return Introduction();
              }
            }
          } else {
            return Scaffold();
          }
        },
      ),
    );
  }
}
