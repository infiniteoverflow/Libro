import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:book_donation/Screens/home_screen.dart';

import '../router/route_constants.dart';

class EmailVerificationScreen extends StatefulWidget {
  @override
  _EmailVerificationScreenState createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final auth = FirebaseAuth.instance;
  User user;
  @override
  void initState() {
    super.initState();
    user = auth.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            'assets/images/verify1.png',
            height: 550,
            width: 300,
          ),
          const Text(
            'Verify your email before continuing !!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
              fontFamily: "Jua",
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'We have sent a mail to ${user.email}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontFamily: "Jua",
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          MaterialButton(
            onPressed: checkEmailVerified,
            height: 60,
            minWidth: 200,
            color: const Color(0xff00B0FF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 8, bottom: 8, left: 50, right: 50),
              child: Text(
                'CONTINUE',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  fontFamily: "Jua",
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> checkEmailVerified() async {
    user = auth.currentUser;
    await user.reload();
    if (user.emailVerified) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          backgroundColor: const Color(0xff00B0FF),
          title: Image.asset(
            'assets/images/verified.png',
            height: 100,
          ),
          content: const Text(
            'You have successfully verified your email',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
                color: Colors.white,
                fontFamily: "Jua"),
          ),
          buttonPadding: const EdgeInsets.only(right: 120),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, homeRoute);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.white,
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'CONTINUE',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    color: Colors.black,
                    fontFamily: "Jua",
                  ),
                ),
              ),
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("You haven't Verified your email yet"),
        ),
      );
    }
  }
}
