import 'package:book_donation/Utils/Styles.dart';
import 'package:book_donation/Screens/intro_screen.dart';
import 'package:flutter/material.dart';
import 'Screens/Login_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Donation App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Styles.colorCustom,
      ),
      home:LoginPage(),
    );
  }
}

