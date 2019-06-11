import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {

  FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLogged = false;

  Future<FirebaseUser> _loginwithFacebook ()
  async {
    var facebookLogin = new FacebookLogin();
    var facebookLoginResult = await facebookLogin.logInWithReadPermissions(['email']);
    debugPrint( 'return data is $facebookLoginResult.accessToken.toString()');
    print('Data >>>>>> is $facebookLoginResult');
    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.error:
        print("Error");
        break;
      case FacebookLoginStatus.cancelledByUser:
        print("CancelledByUser");
        break;
      case FacebookLoginStatus.loggedIn:
        print("LoggedIn");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Login')),
        body: Center(child: Column(children: <Widget>[
          FacebookSignInButton(onPressed:_loginwithFacebook),
    ],
        ),
        )
    );
  }
}

