import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/models/user_model.dart';
import 'package:flutter_ui/widgets/profile_avatar.dart';

class CreatePost extends StatelessWidget {
  CreatePost(this.currentUser);

  final User currentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(10, 10, 12, 0),
      child: Column(
        children: [
          Row(
            children: [
            ProfileAvatar(imageUrl: currentUser.imageUrl,),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                    hintText: 'What\'s on your mind?',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Divider(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlatButton.icon(
                onPressed: () => print('live'),
                icon: Icon(
                  Icons.videocam,
                  color: Colors.red,
                ),
                label: Text('Live'),
              ),
              VerticalDivider(
                width: 10,
              ),
              FlatButton.icon(
                onPressed: () => print('Photo'),
                icon: Icon(
                  Icons.photo_library,
                  color: Colors.green,
                ),
                label: Text('Photo'),
              ),
              VerticalDivider(
                width: 10,
              ),
              FlatButton.icon(
                onPressed: () => print('live'),
                icon: Icon(
                  Icons.video_call,
                  color: Colors.purple,
                ),
                label: Text('Room'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
