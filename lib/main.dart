import 'package:flutter/material.dart';
import 'package:match/discover.dart';
import 'package:match/history.dart';
import 'package:match/profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyApp2(),
    );
  }
}

class MyApp2 extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

@override
class _MyAppState extends State<MyApp2> {
  final double _borderRadius = 24;
  int _selectedIndex = 0;
  final screens = [
    History(),
    Discover(),
    Profile(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orange[100],
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.rocket_launch,
                color: Colors.orange[700],
              ),
              label: 'History'),
          BottomNavigationBarItem(
              // icon: ImageIcon(
              //   AssetImage("images/logo.png"),
              //   size: 60,
              // ),
              icon: Icon(
                Icons.local_fire_department,
                color: Colors.orange[700],
              ),
              label: 'Discover'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.orange[700],
              ),
              label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
