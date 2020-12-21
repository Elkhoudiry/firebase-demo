import 'package:firebase_demo/services/auth_service.dart';
import 'package:firebase_demo/utils/widgets/custom_input_decoration.dart';
import 'package:firebase_demo/utils/widgets/custom_parent_container.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  AuthService _auth = AuthService();

  var _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String error = "";

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Register'),
        actions: [
          FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Login'),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
      body: CustomParentContainer(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20.0),
              TextFormField(
                  decoration:
                      customIntputDecoration.copyWith(hintText: 'Email'),
                  validator: (val) =>
                      val.trim().isEmpty ? "Enter an email" : null,
                  onChanged: (val) => setState(() => email = val.trim())),
              SizedBox(height: 20.0),
              TextFormField(
                  decoration:
                      customIntputDecoration.copyWith(hintText: 'Password'),
                  obscureText: true,
                  validator: (val) => val.trim().length < 6
                      ? "Enter a password that is atleast 6 chars"
                      : null,
                  onChanged: (val) => setState(() => password = val.trim())),
              SizedBox(height: 20.0),
              RaisedButton(
                  color: Colors.pink[400],
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      setState(() => loading = true);
                      var result = await _auth.registerWithEmailAndPassword(
                          email, password);

                      if (result == null) {
                        setState(() {
                          error = 'Error happened';
                          loading = false;
                        });
                        return;
                      }
                      Navigator.pop(context);
                    }
                  }),
              SizedBox(height: 20.0),
              Text(error, style: TextStyle(color: Colors.red))
            ],
          ),
        ),
      ),
    );
  }
}
