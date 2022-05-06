import 'package:booksface/screens/home_page.dart';
import 'package:booksface/widgets/custom_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final List<Widget> _screens = [
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage()
  ];
  final List<IconData> _icons = [
    Icons.home,
    Icons.ondemand_video,
    FontAwesome5.user_circle,
    FontAwesome5.users,
    FontAwesome5.bell,
    Icons.menu
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        body: IndexedStack(index: _selectedIndex,
        children: _screens,),
        bottomNavigationBar: CustomTabBar(
          icons: _icons,
          selectedIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
        ),

      ),
    );
  }
}
