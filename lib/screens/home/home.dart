import 'package:firebase_demo/screens/authentication/sign_in.dart';
import 'package:firebase_demo/screens/home/brew_list.dart';
import 'package:firebase_demo/services/auth_service.dart';
import 'package:firebase_demo/services/firestore_service.dart';
import 'package:firebase_demo/utils/classes/pair.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('Brew Crew'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: [
          FlatButton.icon(
              onPressed: () async {
                await _auth.signout();
              },
              icon: Icon(Icons.person),
              label: Text('Logout'))
        ],
      ),
      body: StreamProvider<Pair<List<UserModel>, FirestoreSource>>.value(
        value: FirestoreService.listenCollection('users', UserModel.create),
        child: Center(
          child: BrewList(),
        ),
      ),
    );
  }
}

String getName(BuildContext context) {
  var result = Provider.of<List<UserModel>>(context);

  return result[0].name;
}
