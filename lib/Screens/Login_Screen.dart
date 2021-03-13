// ignore_for_file: non_constant_identifier_names

import'package:book_donation/Utils/Styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:book_donation/Screens/home_screen.dart';
import 'package:book_donation/Services/google_sign_in.dart';
import 'package:book_donation/Services/facebook_sign_in.dart';

class LoginPage extends StatefulWidget {
  // ignore: file_names
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

  // Make Form Key for Sign-Up or Log-In
  final _signUpFormKey = GlobalKey<FormState>();
  final _logInFormKey = GlobalKey<FormState>();

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
                        child: GestureDetector(
                          child: Container(
                            height: 35,
                            width: 40,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/arrowImage1.png"),
                                    fit: BoxFit.cover)),
                          ),
                          onTap: (){
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/images/authBG 1.png"),
                    )),
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
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45.0),
                    topRight: Radius.circular(45.0)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                              fontFamily: "Jua"),
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
                        Text(
                          "SignUp",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                              fontFamily: "Jua"),
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
      child: Form(
        key: _logInFormKey,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextFormField(
                validator: (mail) {
                  if (mail.length == 0)
                    return "Please Give a Valid Email";
                  else if (mail.contains('@') && mail.contains('.com'))
                    return null;
                  return "Not an Email Structure";
                },
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
                    borderSide: BorderSide(color: Styles.textFieldBorder),
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextFormField(
                validator: (pwd) {
                  if (pwd.length < 6) return "Password at least 6 characters";
                  return null;
                },
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
                    borderSide: BorderSide(color: Styles.textFieldBorder),
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
              color: Styles.colorCustom,
              onPressed: () {
                if (_logInFormKey.currentState.validate()) {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: loginEmailAddress.text,
                          password: loginPassword.text)
                      .then((signedInUser) {
                    bool response =
                        FirebaseAuth.instance.currentUser.emailVerified;
                    if (response) {
                      print("User Id is: ${signedInUser.user.uid}");
                      notify(context, "Congrats! Log-in Complete",
                          "Enjoy this app");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    } else {
                      FirebaseAuth.instance.signOut();
                      notify(context, "Log-in Problem",
                          "Please Verify Email at First and then log in...Email Verification Link Send to Your Reistered Mail");
                    }
                  }).catchError((e) {
                    if (e.toString() ==
                        "[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.")
                      notify(context, "Log-in Problem",
                          "Account Not Found...Please Sign-up at first and then try it");
                    else {
                      notify(context, "Log-in Problem",
                          "Unknown Error at Log-in...Try Again");
                    }
                  });
                }
              },
              child: Text('LOGIN', style: Styles.button()),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Text(
              "OR",
              style: TextStyle(
                  fontSize: 23, fontWeight: FontWeight.bold, fontFamily: "Jua"),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              InkWell(
                onTap: (){
                  signInWithGoogle().then(
                        (result) {
                      if (result != null) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) {
                              return HomeScreen();
                            },
                          ),
                        );
                      };
                    },
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.068,
                  width: MediaQuery.of(context).size.width * 0.14,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/images/google.png"),
                      fit: BoxFit.cover),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  handleFacebookSignin().then((signInDone) {
                    if(signInDone)
                      {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) {
                              return HomeScreen(isFacebookSignIn: true);
                            },
                          ),
                        );
                      };
                  });
                },
                child:Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.15,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("assets/images/fb.png"),
                        fit: BoxFit.cover),
                  ),
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
      ),
    );
  }

  //For SignUp Screen
  Widget signUp() {
    return SingleChildScrollView(
      child: Form(
        key: _signUpFormKey,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextFormField(
                validator: (mail) {
                  if (mail.length == 0)
                    return "Please Give a Valid Email";
                  else if (mail.contains('@') && mail.contains('.com'))
                    return null;
                  return "Not an Email Structure";
                },
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
                    borderSide: BorderSide(color: Styles.textFieldBorder),
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextFormField(
                validator: (pwd) {
                  if (pwd.length < 6) return "Password at least 6 characters";
                  return null;
                },
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
                    borderSide: BorderSide(color: Styles.textFieldBorder),
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
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextFormField(
                validator: (conformPwd) {
                  if (conformPwd.length < 6)
                    return "Password at least 6 characters";
                  else if (signUpPassword.text.length > 5 &&
                      signUpPassword.text != signUpConfirmPassword.text)
                    return "Password and Confirm Password are not Same";
                  return null;
                },
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
                    borderSide: BorderSide(color: Styles.textFieldBorder),
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
              onPressed: () async {
                if (_signUpFormKey.currentState.validate()) {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: this.signUpEmailAddress.text,
                          password: this.signUpPassword.text)
                      .then((signedUpUser) async {
                    await signedUpUser.user.sendEmailVerification();
                    notify(context, "Congrats! Sign up Complete",
                        "Please Log-In to Continue");
                  }).catchError((e) {
                    if (e.toString() ==
                        "[firebase_auth/email-already-in-use] The email address is already in use by another account.") {
                      notify(context, "Sorry! Account Conflict",
                          "Same Account Already Registered...Try Another Account");
                    }
                  });
                }
              },
              child: Text('SIGN-UP', style: Styles.button()),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(
              "OR",
              style: TextStyle(
                  fontSize: 23, fontWeight: FontWeight.bold, fontFamily: "Jua"),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              InkWell(
                onTap: (){
                  signInWithGoogle().then(
                        (result) {
                      if (result != null) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) {
                              return HomeScreen();
                            },
                          ),
                        );
                      };
                    },
                  );
                  },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.068,
                width: MediaQuery.of(context).size.width * 0.14,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("assets/images/google.png"),
                      fit: BoxFit.cover),
                ),
              ),
              ),
              InkWell(
                  onTap: (){
                    handleFacebookSignin().then((signInDone) {
                      if(signInDone)
                      {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) {
                              return HomeScreen(isFacebookSignIn: true);
                            },
                          ),
                        );
                      };
                    });
                  },
                child:Container(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width * 0.15,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("assets/images/fb.png"),
                      fit: BoxFit.cover),
                ),
              )
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
      ),
    );
  }

  void notify(BuildContext context, String _title, String _content) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(_title),
            content: Text(_content),
          );
        });
  }
}
