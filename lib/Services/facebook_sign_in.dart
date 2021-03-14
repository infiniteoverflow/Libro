import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
FacebookLogin facebookLogin = FacebookLogin();
Future<bool> handleFacebookSignin() async {
  final FacebookLoginResult result = await facebookLogin.logIn(['email']);
  switch (result.status) {
    case FacebookLoginStatus.cancelledByUser:
      print("cancelled by user");
      return false;
    case FacebookLoginStatus.error:
      print("There was an error for facebook Sign in");
      return false;
    case FacebookLoginStatus.loggedIn:
      try {
        await signinWithFacebook(result);
        return true;
      } catch (e) {
        print(e);
        return false;
      }
      break;
    default:
      return false;
  }
}

Future<void> signinWithFacebook(FacebookLoginResult result) async {
  //get access token
  final FacebookAccessToken accessToken = result.accessToken;

  //Convert to Auth Credential
  final AuthCredential credential =
      FacebookAuthProvider.credential(accessToken.token);

  //User Credential to Sign in with Firebase
  final a = await _auth.signInWithCredential(credential);
  print("${a.user.displayName} logged in with facebook");
}

Future<void> facebookLogout() async {
  await _auth.signOut().then((onValue) {
    facebookLogin.logOut();
  });
}
