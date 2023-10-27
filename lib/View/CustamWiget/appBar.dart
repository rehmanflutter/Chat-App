import 'package:chat/View/Screen/HomeScreen/Home.dart';
import 'package:chat/View/Screen/Notification/notification.dart';
import 'package:chat/View/Screen/Profile/UserProfile/Profile/profilesee.dart';
import 'package:chat/View/Screen/SearchUsers/searchs.dart';
import 'package:flutter/material.dart';
import 'package:ff_navigation_bar_plus/ff_navigation_bar_plus.dart';

class BottomBarCus extends StatefulWidget {
  @override
  _BottomBarCusState createState() => _BottomBarCusState();
}

class _BottomBarCusState extends State<BottomBarCus> {
  int selectedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);
  final List<Widget> screens = [
    HomeScreen(),
    SearchBox(),
    Notifications(),
    Profile()

    // Center(child: Text('Screen 3')),
    // Center(child: Text('Screen 4')),
    // Center(child: Text('Screen 5')),
    // Add more screens for other tabs as needed
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: screens,
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.white,
          selectedItemBorderColor: Color(0xff111827),
          selectedItemBackgroundColor: Color(0xff111827),
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.black,
        ),
        selectedIndex: selectedIndex,
        onSelectTab: (index) {
          setState(() {
            selectedIndex = index;
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 100), curve: Curves.ease);
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.message,
            label: 'Messages',
          ),
          FFNavigationBarItem(
            iconData: Icons.search,
            label: 'Search',
          ),
          FFNavigationBarItem(
            iconData: Icons.notifications_active,
            label: 'Notification',
          ),
          FFNavigationBarItem(
            iconData: Icons.person,
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
