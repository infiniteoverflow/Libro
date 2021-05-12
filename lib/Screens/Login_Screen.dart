// ignore_for_file: non_constant_identifier_names

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:book_donation/Utils/Styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:book_donation/Services/google_sign_in.dart';
import 'package:book_donation/Services/facebook_sign_in.dart';
import 'package:book_donation/Screens/email_verification_screen.dart';
import 'package:book_donation/Screens/home_screen.dart';

import '../router/route_constants.dart';
import 'package:book_donation/Services/twitter_sign_in.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  String userName;

  // Make Form Key for Sign-Up or Log-In
  final _signUpFormKey = GlobalKey<FormState>();
  final _logInFormKey = GlobalKey<FormState>();

  //for Snack Bar

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
                  Row(
                    children: [
                      SafeArea(
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 0,
                            width: 40,
                            decoration: const BoxDecoration(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.21,
                    decoration: const BoxDecoration(
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
              padding: const EdgeInsets.all(20.0),
              height: 500,
              width: MediaQuery.of(context).size.width - 0,
              decoration: BoxDecoration(
                color: Styles.scaffoldColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(45.0),
                    topRight: Radius.circular(45.0)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // TODO:
                        /// Crash the app once to set up crashlytics in firebase
                        /// to be done on iOS (uncomment below iconbutton wiget and crashlytics import at the top)

                        // IconButton(
                        //     icon: const Icon(Icons.dangerous),
                        //     onPressed: () {
                        //       FirebaseCrashlytics.instance.crash();
                        //     }),
                        const Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                              fontFamily: "Jua"),
                        ),
                        FlutterSwitch(
                          width: 90.0,
                          toggleSize: 20.0,
                          value: isSwitched,
                          borderRadius: 25.0,
                          padding: 7.0,
                          onToggle: (val) {
                            setState(() {
                              isSwitched = val;
                            });
                          },
                        ),
                        const Text(
                          "SignUp",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                              fontFamily: "Jua"),
                        ),
                      ],
                    ),
                    //for switching login and signUp screen
                    if (isSwitched == false) login() else signUp()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void loadingSnackBarAndMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            message,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          const CircularProgressIndicator(),
        ],
      ),
      duration: const Duration(seconds: 7),
    ));
  }

  void errorSnackBarAndMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            message,
            style: const TextStyle(fontSize: 18),
          ),
          const Icon(
            Icons.error,
            color: Colors.red,
            size: 30,
          ),
        ],
      ),
      duration: const Duration(seconds: 3),
    ));
  }

  void hideSnackBar() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
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
                  if (mail.isEmpty) {
                    hideSnackBar();
                    return "Please Give a Valid Email";
                  } else if (mail.contains('@') && mail.contains('.com')) {
                    return null;
                  }
                  hideSnackBar();
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
                  if (pwd.length < 6) {
                    hideSnackBar();
                    return "Password at least 6 characters";
                  }
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
                        ? const Icon(Icons.visibility_off)
                        : const Icon(
                            Icons.visibility), //for show and hide password
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
                  borderRadius: BorderRadius.circular(20.0)),
              color: Styles.colorCustom,
              onPressed: () async {
                loadingSnackBarAndMessage('Logging you in...');

                if (_logInFormKey.currentState.validate()) {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: loginEmailAddress.text,
                          password: loginPassword.text)
                      .then((signedInUser) {
                    final bool response =
                        FirebaseAuth.instance.currentUser.emailVerified;

                    hideSnackBar();

                    if (response) {
                      print("User Id is: ${signedInUser.user.uid}");
                      notify(context, "Congrats! Log-in Complete",
                          "Enjoy this app");
                      Navigator.pushNamed(context, homeRoute);
                    } else {
                      hideSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Please Verify Your Email"),
                        duration: Duration(seconds: 3),
                      ));

                      Navigator.pushReplacementNamed(
                          context, emailVerificationRoute);
                      // notify(context, "Log-in Problem",
                      //     "Please Verify Email at First and then log in...Email Verification Link Send to Your Reistered Mail");
                    }
                  }).catchError((e, StackTrace s) {
                    FirebaseCrashlytics.instance.recordError(e.toString(), s);
                    if (e.toString() ==
                        "[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.") {
                      notify(context, "Log-in Problem",
                          "Account Not Found...Please Sign-up at first and then try it");
                      hideSnackBar();
                    } else {
                      hideSnackBar();
                      notify(context, "Log-in Problem",
                          "Unknown Error at Log-in...Try Again");
                    }

                    errorSnackBarAndMessage('Login Failed, Try Again Later');
                  });
                }
              },
              child: Text('LOGIN', style: Styles.button()),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            const Text(
              "OR",
              style: TextStyle(
                  fontSize: 23, fontWeight: FontWeight.bold, fontFamily: "Jua"),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              InkWell(
                onTap: () {
                  signInWithGoogle().then(
                    (result) {
                      if (result != null) {
                        Navigator.pushNamed(context, homeRoute);
                      }
                    },
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.068,
                  width: MediaQuery.of(context).size.width * 0.14,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("assets/images/google.png"),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  handleFacebookSignin().then((signInDone) {
                    if (signInDone) {
                      Navigator.pushNamed(context, homeRoute, arguments: true);
                    }
                  });
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.15,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("assets/images/fb.png"),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  bool result = await twitterSignIn();
                  print(result);
                  if (result == true) {
                    Navigator.pushNamed(context, homeRoute, arguments: true);
                  } else if (result == false) {
                    Fluttertoast.showToast(
                        msg: "Some error occured try again later",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.15,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("assets/images/twitter.png"),
                        fit: BoxFit.cover),
                  ),
                ),
              )
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
                validator: (name) {
                  if (name.isEmpty) {
                    hideSnackBar();
                    return "Please enter a username.";
                  }
                  return null;
                },
                //controller: userName,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: "Username",
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
                onSaved: (value) {
                  userName = value;
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextFormField(
                validator: (mail) {
                  if (mail.isEmpty) {
                    hideSnackBar();
                    return "Please Give a Valid Email";
                  } else if (mail.contains('@') && mail.contains('.com')) {
                    return null;
                  }
                  hideSnackBar();
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
                  if (pwd.length < 6) {
                    hideSnackBar();
                    return "Password must be at least 6 characters long";
                  }
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
                        ? const Icon(Icons.visibility_off)
                        : const Icon(
                            Icons.visibility), //for show and hide password
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
                  if (conformPwd.length < 6) {
                    hideSnackBar();
                    return "Password must be at least 6 characters long";
                  }
                  if (signUpPassword.text.length > 5 &&
                      signUpPassword.text != conformPwd) {
                    hideSnackBar();
                    return "Password and Confirm Password are not Same";
                  }
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
                        ? const Icon(Icons.visibility_off)
                        : const Icon(
                            Icons.visibility), //for show and hide password
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
                  borderRadius: BorderRadius.circular(20.0)),
              color: Styles.colorCustom,
              onPressed: () async {
                if (signUpConfirmPassword.text != signUpPassword.text) {
                  notify(context, 'Passwords do not match',
                      "'Password' and 'Confirm Password' must be the same");
                }
                loadingSnackBarAndMessage('Signing you up...');
                _signUpFormKey.currentState.save();
                FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: signUpEmailAddress.text,
                        password: signUpPassword.text)
                    .then((signedUpUser) async {
                  await signedUpUser.user.sendEmailVerification();

                  await FirebaseAuth.instance.currentUser
                      .updateProfile(displayName: userName);

                  hideSnackBar();
                  notify(context, "Congrats! Sign up Complete",
                      "Please Log-In to Continue");
                }).catchError((e, StackTrace s) {
                  FirebaseCrashlytics.instance.recordError(e.toString(), s);

                  if (e
                      .toString()
                      .contains('[firebase_auth/email-already-in-use]')) {
                    notify(context, 'Email in Use',
                        'Use another Email to Sign Up');
                  }

                  if (e.toString().contains('[firebase_auth/weak-password]')) {
                    notify(context, 'Weak password',
                        'Password must be at least 6 characters long');
                  }

                  hideSnackBar();
                  errorSnackBarAndMessage('Signup Failed, Try Again Later');
                });
              },
              child: Text('SIGN-UP', style: Styles.button()),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const Text(
              "OR",
              style: TextStyle(
                  fontSize: 23, fontWeight: FontWeight.bold, fontFamily: "Jua"),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              InkWell(
                onTap: () {
                  signInWithGoogle().then(
                    (result) {
                      if (result != null) {
                        Navigator.pushNamed(context, homeRoute);
                      }
                    },
                  );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.068,
                  width: MediaQuery.of(context).size.width * 0.14,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("assets/images/google.png"),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  handleFacebookSignin().then((signInDone) {
                    if (signInDone) {
                      Navigator.pushNamed(context, homeRoute, arguments: true);
                    }
                  });
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.15,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("assets/images/fb.png"),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  bool result = await twitterSignIn();
                  if (result == true) {
                    Navigator.pushNamed(context, homeRoute, arguments: true);
                  } else if (result == false) {
                    Fluttertoast.showToast(
                        msg: "Some error occured try again later",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.15,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("assets/images/twitter.png"),
                        fit: BoxFit.cover),
                  ),
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }

  // void notify(BuildContext context, String _title, String _content) {
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           title: Text(_title),
  //           content: Text(_content),
  //         );
  //       });
  // }

  void notify(BuildContext context, String _title, String _content) {
    final height = MediaQuery.of(context).size.height;
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ), //this right here
            child: Container(
              height: height / 5,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // TextField(
                    //   decoration: InputDecoration(
                    //       border: InputBorder.none,
                    //       hintText: 'What do you want to remember?'),
                    // ),
                    Row(
                      children: [
                        Spacer(),
                        CloseButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: Text(
                        _title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    //Text(_title),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 6),
                      child: Text(
                        _content,
                        style: TextStyle(
                          //fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
