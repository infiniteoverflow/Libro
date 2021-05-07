import 'package:flutter_twitter/flutter_twitter.dart';

Future<bool> twitterSignIn() async {
  var twitterLogin = new TwitterLogin(
    consumerKey: 'c6crYGTAHF1lnGoDBB47VklwA',
    consumerSecret: 'tpbGp2kOG6KKt4xbD3wtggdHn9ZZHHobSqeJNaKnNpRre4FQ0p',
  );

  final TwitterLoginResult result = await twitterLogin.authorize();

  switch (result.status) {
    case TwitterLoginStatus.loggedIn:
      {
        var session = result.session;
        print('Successful sign in ${session.username}');
        return true;
//_sendTokenAndSecretToServer(session.token, session.secret);
        break;
      }
    case TwitterLoginStatus.cancelledByUser:
      print('Cancelled by user');
      return false;
      //_showCancelMessage();
      break;
    case TwitterLoginStatus.error:
      print(result.errorMessage);
      return false;
      //_showErrorMessage(result.error);
      break;
  }
}
