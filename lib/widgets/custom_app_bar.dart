import 'package:booksface/consts/colors.dart';
import 'package:booksface/models/user_model.dart';
import 'package:booksface/widgets/circle_button.dart';
import 'package:booksface/widgets/custom_tab_bar.dart';
import 'package:booksface/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class CustomAppBar extends StatelessWidget {
  final User currentUser;
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;

  const CustomAppBar({Key? key, required this.currentUser, required this.icons, required this.selectedIndex, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Expanded(
          child: Text("BooksFace",style: TextStyle(
            color: Palette.facebookBlue,
            fontSize: 32,
            fontWeight: FontWeight.bold,
            letterSpacing: -1.2,
          ),),
        ),
        Container(
          height: double.infinity,
          width: 600,
          child: CustomTabBar(
            icons: icons,
            selectedIndex: selectedIndex,
            onTap: onTap,
            isBottomIndicator: true
          ),
        ),
          Expanded(child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              UserCard(user: currentUser),
              SizedBox(width: 12,),
              CircleButton(icon: Icons.search, iconSize: 30, onPressed: (){}),
              CircleButton(icon: FontAwesome5.facebook_messenger, iconSize: 30, onPressed: (){}),
            ],
          ))
      ],),
    );
  }
}
