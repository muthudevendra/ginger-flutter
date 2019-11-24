import 'package:flutter/material.dart';

class UpcomingScreen extends StatefulWidget {
  static String id = 'upcoming';
  @override
  _UpcomingScreenState createState() => _UpcomingScreenState();
}

class _UpcomingScreenState extends State<UpcomingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upcoming'),
        backgroundColor: Colors.orange,
      ),
    );
  }
}