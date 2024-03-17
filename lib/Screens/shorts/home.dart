import 'package:flutter/material.dart';
import 'package:house_of_talent/package/models/comment.dart';
import 'package:house_of_talent/package/models/reel.dart';
import 'package:house_of_talent/package/reels_viewer.dart';

class ShortVideosScreen extends StatelessWidget {
  const ShortVideosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<ReelModel> reelsList = [
      ReelModel('https://status.pagalworld.com.cm/files/download/id/1644/1.mp4',
          'Darshan Patil',
          likeCount: 2000,
          isLiked: true,
          musicName: 'In the name of Love',
          reelDescription: "Life is better when you're laughing.",
          profileUrl:
              'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
          commentList: [
            ReelCommentModel(
              comment: 'Nice...',
              userProfilePic:
                  'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
              userName: 'Darshan',
              commentTime: DateTime.now(),
            ),
            ReelCommentModel(
              comment: 'Superr...',
              userProfilePic:
                  'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
              userName: 'Darshan',
              commentTime: DateTime.now(),
            ),
            ReelCommentModel(
              comment: 'Great...',
              userProfilePic:
                  'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
              userName: 'Darshan',
              commentTime: DateTime.now(),
            ),
          ]),
      ReelModel(
        'https://assets.mixkit.co/videos/preview/mixkit-father-and-his-little-daughter-eating-marshmallows-in-nature-39765-large.mp4',
        'Rahul',
        musicName: 'In the name of Love',
        reelDescription: "Life is better when you're laughing.",
        profileUrl:
            'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
      ),
      ReelModel(
        'https://assets.mixkit.co/videos/preview/mixkit-mother-with-her-little-daughter-eating-a-marshmallow-in-nature-39764-large.mp4',
        'Rahul',
      ),
    ];

    return ReelsViewer(
      reelsList: reelsList,
      appbarTitle: 'Instagram Reels',
      showProgressIndicator: true,
      showVerifiedTick: true,
      showAppbar: false,
    );
  }
}
