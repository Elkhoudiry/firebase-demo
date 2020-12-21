import 'package:firebase_demo/models/custom_auth_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/utils/classes/pair.dart';

var _firstCalled = false;

class AuthService {
  //
  // auth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create custome User object based on FirebaseAuth user object
  Pair<CustomAuthUser, AuthPhase> _userFromFirebaseUser(User user) {
    //
    if (user == null) {
      return Pair(first: null, second: AuthPhase.LOGGED_OUT);
    }

    return Pair(
        first: CustomAuthUser(uid: user.uid), second: AuthPhase.LOGGED_IN);
  }

  //auth change user stream
  Stream<Pair<CustomAuthUser, AuthPhase>> get user {
    return _auth.authStateChanges().map((user) {
      try {
        if (!_firstCalled && user != null) {
          _firstCalled = true;
          throw Exception('First call exception');
        } else if (!_firstCalled) {
          _firstCalled = true;
        }
        return _userFromFirebaseUser(user);
      } catch (e) {
        return Pair(first: null, second: AuthPhase.NOT_YET);
      }
    });
  }

  // just sign in
  Future signInAnon() async {
    try {
      UserCredential authResult = await _auth.signInAnonymously();
      return _userFromFirebaseUser(authResult.user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign up with email & password/
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return _userFromFirebaseUser(result.user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email & password/
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return _userFromFirebaseUser(result.user);
    } catch (e) {
      return null;
    }
  }

  // sign out
  Future signout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}

enum AuthPhase { LOGGED_IN, LOGGED_OUT, NOT_YET }
