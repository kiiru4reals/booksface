import 'package:booksface/models/user_model.dart';
import 'package:booksface/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final User user;
  const UserCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileAvatar(imageUrl: user.imageUrl),
          SizedBox(width: 6,),
          Text(user.name, style: TextStyle(
            fontSize: 16
          ),),

        ],
      ),
    );
  }
}
