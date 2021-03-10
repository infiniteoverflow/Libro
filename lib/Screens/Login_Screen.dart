import 'package:book_donation/Utils/Styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isSwitched = false;
  bool showPassword = true;

  //for Login textFields
  final loginEmailAddress = TextEditingController();
  final loginPassword = TextEditingController();
  //for signUp textFields
  final signUpEmailAddress = TextEditingController();
  final signUpPassword = TextEditingController();
  final signUpConfirmPassword = TextEditingController();


  @override
  void dispose() {
    // Cleaning up controllers of login screen
    loginEmailAddress.dispose();
    loginPassword.dispose();
    // Cleaning up controllers of signUp screen
    signUpEmailAddress.dispose();
    signUpPassword.dispose();
    signUpConfirmPassword.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
              bottom: 0,
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.42,
                  decoration: BoxDecoration(
                    color: Styles.colorCustom,
                  ),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.012,
                    ),
                   Row(
                     children: [
                       SafeArea(
                         child: Container(
                           height: 35,width: 40,
                           decoration: BoxDecoration(
                               image: DecorationImage(
                                 image: AssetImage("assets/images/arrowImage1.png"),
                                 fit: BoxFit.cover
                               )
                           ),
                         ),
                       ),
                     ],
                ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/authBG 1.png"),
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ),
          Positioned(
            top: 255,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(20.0),
              height: 500,
              width: MediaQuery.of(context).size.width - 0,
              decoration: BoxDecoration(
                color: Styles.scaffoldColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(45.0),
                    topRight: Radius.circular(45.0)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                            fontFamily: "Jua"
                          ),
                        ),
                        FlutterSwitch(
                          width: 90.0,
                          height: 35.0,
                          toggleSize: 20.0,
                          value: isSwitched,
                          borderRadius: 25.0,
                          padding: 7.0,
                          showOnOff: false,
                          onToggle: (val) {
                            setState(() {
                              isSwitched = val;
                            });
                          },
                        ),
                        Text("SignUp",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                              fontFamily: "Jua"
                          ),
                        ),
                      ],
                    ),
                    //for switching login and signUp screen
                    isSwitched == false ? login() : signUp()
                  ],
                ),
              ),
                  ),
          ),
        ],
      ),
    );
  }

  //For Login Screen
  Widget login() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: TextField(
              controller: loginEmailAddress,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintText: "Email Address",
                hintStyle: TextStyle(color: Styles.textField),
                filled: true,
                fillColor: Styles.textFieldBorder,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Styles.colorCustom),
                  borderRadius: BorderRadius.circular(18.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Styles.textFieldBorder),
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: TextField(
              controller: loginPassword,
              obscureText: showPassword,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(color: Styles.textField),
                filled: true,
                fillColor: Styles.textFieldBorder,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Styles.colorCustom),
                  borderRadius: BorderRadius.circular(18.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Styles.textFieldBorder),
                  borderRadius: BorderRadius.circular(18.0),
                ),
                suffixIcon: IconButton(
                  icon: showPassword
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility), //for show and hide password
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          MaterialButton(
            height: MediaQuery.of(context).size.height * 0.08,
            minWidth: MediaQuery.of(context).size.width * 0.84,
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(20.0)),
            color:Styles.colorCustom,
            onPressed: () {},
            child: Text('LOGIN',
                style: Styles.button()),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Text(
            "OR",
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, fontFamily: "Jua"),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.068,
              width: MediaQuery.of(context).size.width * 0.14,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage("assets/images/google.png"),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage("assets/images/fb.png"),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage("assets/images/twitter.png"),
                    fit: BoxFit.cover),
              ),
            ),
          ]),
        ],
      ),
    );
  }

  //For SignUp Screen
  Widget signUp() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: TextField(
              controller: signUpEmailAddress,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintText: "Email Address",
                hintStyle: TextStyle(color: Styles.textField),
                filled: true,
                fillColor: Styles.textFieldBorder,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Styles.colorCustom),
                  borderRadius: BorderRadius.circular(18.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color:Styles.textFieldBorder),
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: TextField(
              controller: signUpPassword,
              obscureText: showPassword,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(color: Styles.textField),
                filled: true,
                fillColor: Styles.textFieldBorder,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Styles.colorCustom),
                  borderRadius: BorderRadius.circular(18.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Styles.textFieldBorder),
                  borderRadius: BorderRadius.circular(18.0),
                ),
                suffixIcon: IconButton(
                  icon: showPassword
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility), //for show and hide password
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: TextField(
              controller: signUpConfirmPassword,
              obscureText: showPassword,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                hintText: "Confirm Password",
                hintStyle: TextStyle(color: Styles.textField),
                filled: true,
                fillColor: Styles.textFieldBorder,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Styles.colorCustom),
                  borderRadius: BorderRadius.circular(18.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Styles.textFieldBorder),
                  borderRadius: BorderRadius.circular(18.0),
                ),
                suffixIcon: IconButton(
                  icon: showPassword
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility), //for show and hide password
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          MaterialButton(
            height: MediaQuery.of(context).size.height * 0.08,
            minWidth: MediaQuery.of(context).size.width * 0.84,
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(20.0)),
            color: Styles.colorCustom,
            onPressed: () {},
            child: Text('LOGIN',
                style: Styles.button()),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Text(
            "OR",
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, fontFamily: "Jua"),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.015,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.068,
              width: MediaQuery.of(context).size.width * 0.14,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage("assets/images/google.png"),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage("assets/images/fb.png"),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage("assets/images/twitter.png"),
                    fit: BoxFit.cover),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
