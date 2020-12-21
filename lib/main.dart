import 'package:firebase_demo/models/custom_auth_user.dart';
import 'package:firebase_demo/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_demo/services/auth_service.dart';
import 'package:firebase_demo/utils/classes/pair.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Pair<CustomAuthUser, AuthPhase>>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
