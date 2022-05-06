import 'package:booksface/consts/colors.dart';
import 'package:booksface/models/post_model.dart';
import 'package:booksface/widgets/profile_avatar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _PostHeader(post: post),
                SizedBox(height: 4,),
                Text(post.caption),
                post.imageUrl != null
                    ? const SizedBox.shrink()
                    : const SizedBox(height: 6,),
              ],
            ),
          ),
          post.imageUrl != null ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: CachedNetworkImage(imageUrl: post.imageUrl),
          ) : SizedBox.shrink(),

          Padding(padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: _PostStats(post: post),)
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  const _PostHeader({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl,
        ),
        SizedBox(width: 8,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(post.user.name, style: TextStyle(
                fontWeight: FontWeight.w600,
              ),),
              Row(
                children: [
                  Text('${post.timeAgo}', style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12
                  ),),
                  Icon(Icons.public, color: Colors.grey[600], size: 12,)
                ],
              ),
            ],
          ),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz),)
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;

  const _PostStats({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Row(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Palette.facebookBlue,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.thumb_up, size: 10, color: Colors.white,),
          ),
          const SizedBox(width: 4,),
          Expanded(
            child: Text('${post.likes}', style: TextStyle(
              color: Colors.grey[600],
            ),),
          ),
          Text('${post.comments} Comments', style: TextStyle(
            color: Colors.grey[600],
          ),),
          SizedBox(width: 8,),
          Text('${post.shares} Shares', style: TextStyle(
            color: Colors.grey[600],
          ),),
        ],
      ),
        const Divider(),
        Row(
          children: [
            _PostButton(icon: Icon(FontAwesome5.thumbs_up, size: 20,), label: 'Like', onTap: (){},),
            _PostButton(icon: Icon(FontAwesome5.comment, size: 25,), label: 'Comment', onTap: (){},),
            _PostButton(icon: Icon(Icons.share_outlined, size: 25,), label: 'Share', onTap: (){},),


          ],
        )
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final VoidCallback onTap;
  const _PostButton({Key? key, required this.icon, required this.label, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(
                  width: 4,
                ),
                Text(label),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
