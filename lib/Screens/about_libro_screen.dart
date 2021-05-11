import 'package:flutter/material.dart';

class AboutLibroScreen extends StatelessWidget {
  static const routeName = '/about-libro';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Libro"),
      ),
      body: Center(
        child: Text("Details about what this app does"),
      ),
    );
  }
}
