import 'package:ginger/screens/home_screen.dart';
import 'package:ginger/screens/login_screen.dart';
import 'package:ginger/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:ginger/i10n/app_localization.dart';
import 'package:ginger/screens/welcome_screen.dart';
import 'package:ginger/services/network_provider.dart';

void main(){
  ConnectionStatus connectionStatus = ConnectionStatus.getInstance();
  connectionStatus.initialize();
  runApp(Ginger());
}

class Ginger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', '')
      ],
      initialRoute: WelcomeScreen.id ,
      routes: {
        WelcomeScreen.id: (BuildContext context) => new WelcomeScreen(),
        LoginScreen.id: (BuildContext context) => new LoginScreen(),
        RegistrationScreen.id: (BuildContext context) => new RegistrationScreen(),
        HomeScreen.id: (BuildContext context) => new HomeScreen()
      },
    );
  }
}