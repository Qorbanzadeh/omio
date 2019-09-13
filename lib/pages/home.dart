import 'package:flutter/material.dart';
import 'package:omio_clone/pages/history.dart';
import 'package:omio_clone/pages/profile.dart';
import 'package:omio_clone/pages/search.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int _currentIndex = 0;

  final List<Widget> _viewContainer = [
    SearchPage(),
    HistoryPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    void _onTabTabbed(int index) {
      setState(() {
        _currentIndex = index;
      });
    }

    return Scaffold(
      body: _viewContainer[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTabTabbed,
        currentIndex: _currentIndex,
        fixedColor: Colors.redAccent,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.edit_location,
              color: Colors.blueGrey,
            ),
            title: Text(''),
            activeIcon: Icon(Icons.location_on),
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.view_compact,
                color: Colors.blueGrey,
              ),
              title: Text(''),
              activeIcon: Icon(Icons.compare)),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.blueGrey,
            ),
            title: Text(''),
            activeIcon: Icon(Icons.person_outline)
          ),
        ],
      ),
    );
  }
}
