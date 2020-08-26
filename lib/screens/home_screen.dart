import 'package:flutter/material.dart';
import 'package:flutter_ui/config/palette.dart';
import 'package:flutter_ui/data/data.dart';
import 'package:flutter_ui/models/post_model.dart';
import 'package:flutter_ui/widgets/circle_button.dart';
import 'package:flutter_ui/widgets/create_on_liners.dart';
import 'package:flutter_ui/widgets/create_post.dart';
import 'package:flutter_ui/widgets/post_container.dart';
import 'package:flutter_ui/widgets/stories.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            title: Text(
              'Facebook',
              style: TextStyle(
                letterSpacing: -1.1,
                color: Palette.facebookBlue,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            floating: true,
            actions: [
              CircleButton(
                iconData: Icons.search,
                iconSize: 30,
                onPressed: () => print('search'),
              ),
              CircleButton(
                iconData: MdiIcons.facebookMessenger,
                iconSize: 30,
                onPressed: () => print('messenger'),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: CreatePost(
              currentUser,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0, 12, 0, 5),
            sliver: SliverToBoxAdapter(
              child: CreateOnLiners(onlineUsers),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
            sliver: SliverToBoxAdapter(
              child: Stories(
                currentUser: currentUser,
                stories: stories,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final Post post = posts[index];
                return PostContainer(post: post);
              },
              childCount: posts.length,
            ),
          ),
        ],
      ),
    );
  }
}
