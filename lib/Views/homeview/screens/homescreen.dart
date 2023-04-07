import 'package:era/Views/homeview/screens/addscreen.dart';
import 'package:era/Views/homeview/screens/tryBlue.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import 'mainscreen.dart';
import 'notificationscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final _screens = [
    const MainScreen(),
    const AddScreen(),
    // const NotificationScreen(),
    const TryBlue()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: _screens
              .asMap()
              .map((i, screen) => MapEntry(
                  i,
                  Offstage(
                    offstage: _currentIndex != i,
                    child: screen,
                  )))
              .values
              .toList()),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        backgroundColor: pColor,
        showSelectedLabels: false,
        selectedItemColor: Colors.white,
        showUnselectedLabels: false,
        elevation: 0,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(
              Icons.home,
            ),
            label: 'home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.plus_app,
            ),
            activeIcon: Icon(
              CupertinoIcons.plus_app_fill,
            ),
            label: 'add',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                const Icon(
                  Icons.notifications_none,
                ),
                Positioned(
                  bottom: 15,
                  right: 1,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                )
              ],
            ),
            activeIcon: const Icon(
              Icons.notifications,
            ),
            label: 'notifications',
          )
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
      ),
    );
  }
}
