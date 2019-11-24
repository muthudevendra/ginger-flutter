import 'package:ginger/constants/style_constants.dart';
import 'package:ginger/i10n/app_localization.dart';
import 'package:ginger/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Hero(
                tag: 'logo',
                child: Container(
                  height: 250.0,
                  child: Image.asset('images/two.png'),
                ),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                labelText: AppLocalizations.of(context).translate('enter_email'),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                labelText: AppLocalizations.of(context).translate('enter_password'),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: RoundedButton(
                buttonColor: Colors.orange[400],
                buttonText: AppLocalizations.of(context).translate('login'),
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(HomeScreen.id, ModalRoute.withName(HomeScreen.id));
                },
                textColor: Colors.white,
              ),
            ),     
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                  ),
                  elevation: 5.0,
                  color: Colors.blue,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.google,
                        color: Colors.white,
                        size: 15,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        AppLocalizations.of(context).translate('fb'),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0
                        ),
                      ),
                    ],
                  ), 
                  onPressed: () {},
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                  ),
                  elevation: 5.0,
                  color: Colors.red,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.google,
                        color: Colors.white,
                        size: 15,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        AppLocalizations.of(context).translate('google'),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0
                        ),
                      ),
                    ],
                  ), 
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
