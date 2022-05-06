import 'package:booksface/consts/colors.dart';
import 'package:flutter/material.dart';
class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;
  const CustomTabBar({Key? key, required this.icons, required this.selectedIndex, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
        border: Border(top: BorderSide(color: Palette.facebookBlue,
        width: 3))
      ),
      tabs: icons.map((e) => Tab(icon: Icon(e),
      )
      ).toList(),
    );
  }
}
