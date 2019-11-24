import 'package:ginger/screens/registration_screen.dart';
import 'package:ginger/widgets/rounded_button.dart';
import 'package:ginger/i10n/app_localization.dart';
import 'package:ginger/screens/login_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController( duration: Duration(seconds: 1), vsync: this);
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/two.png'),
                    height: 80.0,
                  ),
                ),
                Text(
                  AppLocalizations.of(context).translate('welcome_title'),
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange[700]
                  ),),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: RoundedButton(
                buttonColor: Colors.orange[400],
                buttonText: AppLocalizations.of(context).translate('login'),
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
                textColor: Colors.white,
              )
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: RoundedButton(
                buttonColor: Colors.orange[700],
                buttonText: AppLocalizations.of(context).translate('register'),
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                },
                textColor: Colors.white,
              )
            ),
          ],
        ),
      ),
    );
  }
}