import 'package:flutter/material.dart';
import 'package:book_donation/Services/google_sign_in.dart';
import 'intro_screen.dart';
import 'package:book_donation/Services/facebook_sign_in.dart';
class HomeScreen extends StatefulWidget {
  final bool isFacebookSignIn;
  const HomeScreen({this.isFacebookSignIn});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () => widget.isFacebookSignIn?facebookLogout().then((value){
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Introduction()),
                    (Route<dynamic> route) => false);}):signOutGoogle().then(
                  (res) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Introduction()),
                        (Route<dynamic> route) => false);
              },
            ),
          )
        ],
      ),
    );
  }
}
