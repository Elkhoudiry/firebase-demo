import 'package:firebase_demo/screens/authentication/sign_in.dart';
import 'package:firebase_demo/services/firestore_service.dart';
import 'package:firebase_demo/utils/classes/pair.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    var users = Provider.of<Pair<List<UserModel>, FirestoreSource>>(context);

    return Container();
  }
}
