import 'package:flutter/material.dart';

class CustomParentContainer extends StatelessWidget {
  final Widget child;

  CustomParentContainer({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: child,
    );
  }
}
