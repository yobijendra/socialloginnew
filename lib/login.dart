import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'home.dart';
import 'package:google_sign_in/google_sign_in.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {

  FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLogged = false;
  var facebookLogin = new FacebookLogin();
  var googleAuth = new GoogleSignIn();

//  Google Sign IN

  loginWithGoogle() {
    print('Hi I am Bijendra SInfgh');

    googleAuth.signIn().then((result) {
      result.authentication.then((googleKey) {
        FirebaseAuth.instance.signInWithGoogle(
            idToken: googleKey.idToken, accessToken: googleKey.accessToken)
            .then((signedInUser) {
          print('Signed in as ${signedInUser.displayName}');
          var userInfo = {
            'name' : signedInUser.displayName,
            'email' : signedInUser.email,
          };
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => home(userInfo,facebookLogin, googleAuth, _auth)));
        }).catchError((e) {print(e);});
      });
    });


//    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;
//    print('User Sign is is ${gSA.accessToken}');
//    FirebaseUser user = await _auth.signInWithGoogle(
//        idToken: gSA.idToken, accessToken: gSA.accessToken);
//    print('User Name $user');
  }


  Future<FirebaseUser> _loginwithFacebook() async {
    var facebookLoginResult = await facebookLogin.logInWithReadPermissions(
        ['email', 'public_profile']);
    debugPrint('return data is $facebookLoginResult');
    print('Data >>>>>> is $facebookLoginResult');
    print('Access Token >>>>>> is ${facebookLoginResult.accessToken.token}');

    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.error:
        print("Error");
        break;
      case FacebookLoginStatus.cancelledByUser:
        print("CancelledByUser");
        break;
      case FacebookLoginStatus.loggedIn:
        FirebaseAuth.instance.signInWithFacebook(
            accessToken: facebookLoginResult.accessToken.token)
            .then((signedInUser) {
          print('Signed in as ${signedInUser.displayName}');
          print('Signed in as $signedInUser');
          var userInfo = {
             'name' : signedInUser.displayName,
             'email' : signedInUser.email,
          };
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => home(userInfo,facebookLogin, googleAuth, _auth)));
        }).catchError((error) {
          print('error to login is $error');
        });
        print("LoggedIn");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Login')),
        body: Center(child: Column(children: <Widget>[
          FacebookSignInButton(onPressed: _loginwithFacebook),
          GoogleSignInButton(onPressed: loginWithGoogle,),
        ],
        ),
        )
    );
  }
}

