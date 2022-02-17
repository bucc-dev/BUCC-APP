///!THIS IS THE APP HOME SCREEN.
///!THE APP BAR IS A PREFERRED SIZE WIDGET, HOUSING A TITLE BAR WIDGET
///! THE BODY IS A TAB BAR WHOSE VIEWS ARE THE WIDGETS ...
///!LatestActivity() && Events().

import 'package:bucc_app/themes/theme.dart';
import 'package:bucc_app/view/custom_widgets/custom_app_bar.dart';
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
    Size _screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(_screenSize.height * 0.11),
        child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
            child: _selectedIndex == 0
                ? const TitleBarWidget(
                    pageTitle: "home",
                  )
                : const TitleBarWidget(
                    pageTitle: "notifications",
                  )),
      ),

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

/* Widget? fetchPageFromBottomBarSelection({required int pageIndex}) {
  Widget? _theSelectedPage;
  switch (pageIndex) {
    case 0:
      _theSelectedPage = const HomeFeed();
      break;
    case 1:
      _theSelectedPage = const NotificationsPage();
      break;
    default:
      const HomeFeed();
  }

  return _theSelectedPage;
}
 */