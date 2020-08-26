import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/models/story_model.dart';
import 'package:flutter_ui/models/user_model.dart';
import 'package:flutter_ui/widgets/profile_avatar.dart';

class Stories extends StatelessWidget {
  Stories({@required this.currentUser, @required this.stories});

  final User currentUser;
  final List<Story> stories;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 10),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + stories.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: _StoryCard(currentUser: currentUser, isAddToStory: true),
              );
            }
            final Story story = stories[index - 1];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: _StoryCard(story: story),
            );
          }),
    );
  }
}

class _StoryCard extends StatelessWidget {
  _StoryCard({this.currentUser, this.isAddToStory = false, this.story});

  final User currentUser;
  final bool isAddToStory;
  final Story story;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CachedNetworkImage(
            imageUrl: isAddToStory ? currentUser.imageUrl : story.imageUrl,
            fit: BoxFit.cover,
            height: double.infinity,
            width: 125,
          ),
        ),
        Positioned(
          top: 8,
          left: 8,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: isAddToStory
                ? Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey, shape: BoxShape.circle),
                    child: Icon(
                      Icons.add,
                      size: 30,
                      color: Colors.white,
                    ),
                  )
                : ProfileAvatar(
                    imageUrl: story.user.imageUrl,
                    isActive: false,
                    hasBorder: !story.isViewed,
                  ),
          ),
        ),
        Positioned(
          bottom: 8,
          left: 8,
          right: 8,
          child: Text(
            isAddToStory ? 'Add To Story' : story.user.name,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
