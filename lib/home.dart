import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class home extends StatelessWidget {
  var userData;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  var facebookLogin = new FacebookLogin();
  var googleAuth = new GoogleSignIn();


  home(userDataGet, fbLogin, googleAuths, firebase_Auth)
  {
    userData = userDataGet;
    firebaseAuth = firebase_Auth;
    facebookLogin = fbLogin;
    googleAuth =  googleAuths;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(children: <Widget>[
        Text('Login user is \n $userData'),
        RaisedButton(onPressed: () async {
         await FirebaseAuth.instance.signOut();
         await facebookLogin.logOut();
         await googleAuth.signOut();
         await FacebookLogin.channel.invokeMethod("logOut");
          Navigator.pop(context);
          print('User Sign Out Successfully');
        }, child: Text('Log out'),
          color: Colors.red,
          textColor: Colors.white,
        ),
      ],),
    );
  }
}
