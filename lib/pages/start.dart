import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/About_app.dart';
import 'package:flutter_application_1/pages/developers.dart';
import 'package:flutter_application_1/pages/profile.dart';
import 'package:flutter_application_1/pages/staggured_grid_grid.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    AboutPage(),
    staggededr_view(),
    ProfilePage(),
    Developers(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '✨Welcome✨',
          style: TextStyle(fontSize: 20, color: Color(0xFFFEC500)),
        ),

        centerTitle: true,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Color(0xFFFEC500),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.report_rounded),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(
            icon: Icon(Icons.developer_mode),
            label: 'Developer',
          ),
        ],
      ),
    );
  }
}
