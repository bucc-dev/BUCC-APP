///This is the app home screen.
///THERE IS NO APP BAR, AS EACH SCREEN CALLED AT ...
/// ... HomeScreenWrapper(pageIndex: _selectedIndex), Implements it's own appbar.
///THE BODY IS A TAB BAR WHOSE VIEWS ARE THE WIDGETS ...
///... LatestActivity() && Events().

import 'package:bucc_app/themes/theme.dart';
import 'package:bucc_app/view/general_widgets/home_screen_wrapper.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //!HOME
      body: HomeScreenWrapper(pageIndex: _selectedIndex),

      //!BOTTOM BAR
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: const Color(0xFF1D2F5F),
          unselectedItemColor: lightGrey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_outlined),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book_outlined),
              label: 'Planner',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.backpack_outlined),
              label: 'Backpack',
            ),
          ]),
    );
  }
}
