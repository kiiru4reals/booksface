import 'package:booksface/consts/colors.dart';
import 'package:booksface/data/data.dart';
import 'package:booksface/models/user_model.dart';
import 'package:booksface/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  const Rooms({Key? key, required this.onlineUsers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        color: Colors.white,
        child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
            scrollDirection: Axis.horizontal,
            itemCount: 1 + onlineUsers.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: _CreateRoomButton(),
                );
              }
              final User user = onlineUsers[index - 1];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ProfileAvatar(
                  imageUrl: user.imageUrl,
                  isActive: true,
                ),
              );
            }));
  }
}

class _CreateRoomButton extends StatelessWidget {
  const _CreateRoomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      child: Row(
        children: [
          ShaderMask(
              shaderCallback: (rect) =>
                  Palette.createRoomGradient.createShader(rect),
              child: Icon(
                Icons.video_call,
                size: 35,
                color: Colors.white,
              )),
          const SizedBox(
            width: 4.0,
          ),
          Text(
            "Create Room",
            style: TextStyle(
              color: Palette.facebookBlue,
            ),
          ),
        ],
      ),
      style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          side: BorderSide(width: 3, color: Colors.blueAccent)),
    );
  }
}
