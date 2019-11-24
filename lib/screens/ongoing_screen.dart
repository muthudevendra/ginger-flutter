import 'package:flutter/material.dart';

class OngoingScreen extends StatefulWidget {
  static String id = 'ongiong';
  @override
  _OngoingScreenState createState() => _OngoingScreenState();
}

class _OngoingScreenState extends State<OngoingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ongoing'),
        backgroundColor: Colors.orange,
      ),
    );
  }

  @override
  void dispose() {
    // _bloc.dispose();
    super.dispose();
  }
}