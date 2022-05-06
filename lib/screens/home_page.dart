import 'package:booksface/consts/colors.dart';
import 'package:booksface/data/data.dart';
import 'package:booksface/models/post_model.dart';
import 'package:booksface/widgets/circle_button.dart';
import 'package:booksface/widgets/create_post_container.dart';
import 'package:booksface/widgets/post_container.dart';
import 'package:booksface/widgets/rooms.dart';
import 'package:booksface/widgets/stories.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            systemOverlayStyle: SystemUiOverlayStyle.light,
            backgroundColor: Colors.white,
            title: Text("BooksFace", style: TextStyle(
              color: Palette.facebookBlue,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2,
            ),),
            floating: true,
            actions: [
              CircleButton(icon: Icons.search, iconSize: 30, onPressed: (){}),
              CircleButton(icon: FontAwesome5.facebook_messenger, iconSize: 30, onPressed: (){})
            ],
          ),
          SliverToBoxAdapter(
            child: CreatePostContainer(currentUser: currentUser)
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
            sliver: SliverToBoxAdapter(
              child: Rooms(onlineUsers: onlineUsers),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            sliver: SliverToBoxAdapter(
              child: Stories(currentUser: currentUser, stories: stories),
            ),
          ),
          SliverList(delegate: SliverChildBuilderDelegate((context, index) {
            final Post post = posts[index];
            return PostContainer(post: post);
          },
          childCount: posts.length,
          )
          )
        ],
      ),

    );
  }
}
