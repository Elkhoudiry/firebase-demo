import 'package:firebase_demo/models/custom_auth_user.dart';
import 'package:firebase_demo/screens/authentication/authentication.dart';
import 'package:firebase_demo/screens/home/home.dart';
import 'package:firebase_demo/services/auth_service.dart';
import 'package:firebase_demo/utils/classes/pair.dart';
import 'package:firebase_demo/utils/widgets/custome_full_screen_loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pair = Provider.of<Pair<CustomAuthUser, AuthPhase>>(context);

    // return either Home or Authenticare widget
    return _getScreen(pair);
  }

  Widget _getScreen(Pair<CustomAuthUser, AuthPhase> pair) {
    if (pair == null || pair.second == AuthPhase.NOT_YET) {
      return CustomFullScreenLoading();
    }

    if (pair.second == AuthPhase.LOGGED_IN) {
      return Home();
    }

    return Authenticate();
  }
}
