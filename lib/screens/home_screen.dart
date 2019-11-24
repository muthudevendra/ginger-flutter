import 'package:flutter/material.dart';
import 'package:ginger/screens/ongoing_screen.dart';
import 'package:ginger/screens/popular_screen.dart';
import 'package:ginger/screens/upcoming_screen.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    new PopularScreen(),
    new OngoingScreen(),
    new UpcomingScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.flash_on),
            title: Text('Popular'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bubble_chart),
            title: Text('Ongoing'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.album),
            title: Text('Upcoming'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        onTap: _onItemTapped,
      ),
    );
  }
}