// import 'package:book_donation/Screens/Login_Screen.dart';
import 'package:book_donation/Models/preferences.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:hive/hive.dart';

import '../router/route_constants.dart';

class Introduction extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return IntroductionState();
  }
}

class IntroductionState extends State<Introduction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.075),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.27,
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/images/Reading 1.png"),
                      fit: BoxFit.cover,
                    )),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.01,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        const Align(
                          alignment: Alignment(-0.050, -1.50),
                          child: Text(
                            "Libro",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 55,
                                fontFamily: 'IrishGrover'),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        const Text(
                          "Get your favourite\n      books from\n  people like you!!",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              fontFamily: 'IrishGrover'),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.41,
                    width: MediaQuery.of(context).size.width * 0.59,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/images/Sharing 1.png"),
                      fit: BoxFit.cover,
                    )),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.041),
              // ignore: avoid_unnecessary_containers
              Container(
                margin: const EdgeInsets.only(bottom: 30.0, top: 10.0),
                // ignore: deprecated_member_use
                child: RaisedButton(
                  onPressed: () {
                    Hive.box('preferences').put(
                        0,
                        Preferences(
                          firstTime: false,
                        ));
                    Navigator.pushNamed(context, loginRoute);
                  },
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35.0),
                          topRight: Radius.circular(35.0))),
                  color: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                      vertical: 18, horizontal: 143.8),
                  child: const AutoSizeText(
                    'CONTINUE',
                    maxFontSize: 36,
                    maxLines: 1,
                    style: TextStyle(
                        fontFamily: 'HanaleiFill',
                        fontSize: 35.0,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
