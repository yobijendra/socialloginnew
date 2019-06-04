import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
//import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Login')),
        body: Center(child: Column(children: <Widget>[
          GoogleSignInButton(onPressed: () {}),
          GoogleSignInButton(onPressed: () {}, darkMode: true),
          FacebookSignInButton(onPressed: () {}),
          TwitterSignInButton(onPressed: () {}),
    ],
        ),
        )
    );
  }
}

