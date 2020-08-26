import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/config/palette.dart';
import 'package:flutter_ui/models/post_model.dart';
import 'package:flutter_ui/widgets/profile_avatar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _PostHeader(post: post),
                SizedBox(
                  height: 5,
                ),
                Text('${post.caption}'),
              ],
            ),
          ),
          post.imageUrl != null
              ? CachedNetworkImage(
                  imageUrl: post.imageUrl,
                )
              : SizedBox.shrink(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: _PostStates(post: post),
          ),
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  const _PostHeader({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(
          imageUrl: post.user.imageUrl,
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${post.user.name}',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Text('${post.timeAgo}'),
                  SizedBox(
                    width: 4,
                  ),
                  Icon(
                    Icons.public,
                    size: 18,
                    color: Colors.grey[600],
                  ),
                ],
              ),
            ],
          ),
        ),
        IconButton(
          icon: Icon(Icons.more_horiz),
          onPressed: () {},
        ),
      ],
    );
  }
}

class _PostStates extends StatelessWidget {
  final Post post;

  const _PostStates({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 2),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Palette.facebookBlue, shape: BoxShape.circle),
                      child: Icon(
                        Icons.thumb_up,
                        color: Colors.white,
                        size: 14,
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      '${post.likes}',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              Text(
                '${post.comments} Comment',
                style: TextStyle(color: Colors.grey[600]),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                '${post.shares} Shares',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _PostButton(
                icon: Icon(MdiIcons.thumbUpOutline,color: Colors.grey[700],),
                label: 'Like',
              ),
              _PostButton(
                icon: Icon(MdiIcons.commentOutline,color: Colors.grey[700],),
                label: 'Comment',
              ),
              _PostButton(
                icon: Icon(MdiIcons.shareOutline,color: Colors.grey[700],size: 30,),
                label: 'Share',
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;

  const _PostButton({Key key, this.icon, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            icon,
            SizedBox(
              width: 4,
            ),
            Text(
              label,
              style: TextStyle(color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}
