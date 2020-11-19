import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // just sign in
  Future signInAnon() async {
    try {
      UserCredential authResult = await _auth.signInAnonymously();
      return authResult.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign up with email & password/

  // sign in with email & password/

  // sign out

}
