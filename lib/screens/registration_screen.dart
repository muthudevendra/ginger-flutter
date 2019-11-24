import 'package:ginger/i10n/app_localization.dart';
import 'package:ginger/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import '../constants/style_constants.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
                  height: 200.0,
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
                labelText:
                  AppLocalizations.of(context).translate('enter_email')),
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
                labelText:
                  AppLocalizations.of(context).translate('enter_password')),
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
                labelText:
                  AppLocalizations.of(context).translate('re_enter_password')),
            ),
            SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: RoundedButton(
                buttonColor: Colors.orange[700],
                buttonText: AppLocalizations.of(context).translate('register'),
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                },
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
