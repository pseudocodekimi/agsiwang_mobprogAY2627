import 'package:flutter/material.dart';

import '../widgets/newsfeed_card.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 8, bottom: 12),
      children: const [
        NewsFeedCard(
          userName: 'kate mwhehe',
          postContent: 'Hello po.',
          numOfLikes: 100,
          avatarAsset: 'assets/assets/images/loopy.jpg',
          date: 'October 11',
        ),
        NewsFeedCard(
          userName: 'si kate ulit',
          postContent: 'Hello, World!',
          numOfLikes: 200,
          hasImage: true,
          avatarAsset: 'assets/assets/images/loopy2.jpg',
          imageAsset: 'assets/assets/images/lily.jpg',
          date: 'December 2',
        ),
      ],
    );
  }
}
