import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/config/palette.dart';
import 'package:flutter_ui/models/user_model.dart';
import 'package:flutter_ui/widgets/profile_avatar.dart';

class CreateOnLiners extends StatelessWidget {
  CreateOnLiners(this.onLineUsers);

  final List<User> onLineUsers;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: Colors.white,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + onLineUsers.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _CreateRoom();
          }
          final User user = onLineUsers[index -1];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: ProfileAvatar(
              imageUrl: user.imageUrl,
              isActive: true,
            ),
          );
        },
      ),
    );
  }
}

class _CreateRoom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 7, 0),
      child: OutlineButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        borderSide: BorderSide(
          width: 2,
          color: Colors.blueAccent[100],
        ),
        textColor: Palette.facebookBlue,
        child: Row(
          children: [
            ShaderMask(
              shaderCallback: (rect) => Palette.createRoomGradient.createShader(rect),
              child: Icon(
                Icons.video_call,
                size: 30,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Text('Create\nRoom'),
          ],
        ),
      ),
    );
  }
}
