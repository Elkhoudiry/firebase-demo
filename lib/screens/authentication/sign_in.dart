import 'package:firebase_demo/screens/authentication/register.dart';
import 'package:firebase_demo/services/auth_service.dart';
import 'package:firebase_demo/utils/widgets/custom_input_decoration.dart';
import 'package:firebase_demo/utils/widgets/custom_parent_container.dart';
import 'package:firebase_demo/utils/widgets/custom_on_button_loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
        title: Text('Sign in'),
        actions: [
          FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Register'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Register()));
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
                  child: loading
                      ? CustomOnButtonLoading()
                      : Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      setState(() => loading = true);

                      var result = await _auth.signInWithEmailAndPassword(
                          email, password);

                      if (result == null) {
                        setState(() {
                          error = 'Error happened';
                          loading = false;
                        });
                        return;
                      }
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

class UserModel {
  var name = "";
  var age = 0;
  var color = "";
  var city = "";

  static UserModel create(Map map) {
    var model = UserModel();

    model.name = map['name'];
    model.age = map['age'];
    model.color = map['color'];
    model.city = map['city'];

    return model;
  }
}
