import 'package:card_swiper/card_swiper.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:house_of_talent/package/like.dart';
import 'package:house_of_talent/package/models/reel.dart';
import 'package:house_of_talent/package/screen_options/screenoptions.dart';
import 'package:house_of_talent/package/utils/url.dart';

import 'package:video_player/video_player.dart';

class ReelsPage extends StatefulWidget {
  final ReelModel item;
  final bool showVerifiedTick;
  final Function(String)? onShare;
  final Function(String)? onLike;
  final Function(String)? onComment;
  final Function()? onClickMoreBtn;
  final Function()? onFollow;
  final SwiperController swiperController;
  final bool showProgressIndicator;
  const ReelsPage({
    Key? key,
    required this.item,
    this.showVerifiedTick = true,
    this.onClickMoreBtn,
    this.onComment,
    this.onFollow,
    this.onLike,
    this.onShare,
    this.showProgressIndicator = true,
    required this.swiperController,
  }) : super(key: key);

  @override
  State<ReelsPage> createState() => _ReelsPageState();
}

class _ReelsPageState extends State<ReelsPage> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  bool _liked = false;
  @override
  void initState() {
    super.initState();
    if (!UrlChecker.isImageUrl(widget.item.url) &&
        UrlChecker.isValid(widget.item.url)) {
      initializePlayer();
    }
  }

  Future initializePlayer() async {
    _videoPlayerController = VideoPlayerController.network(widget.item.url);
    await Future.wait([_videoPlayerController.initialize()]);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      showControls: false,
      looping: false,
    );
    setState(() {});
    _videoPlayerController.addListener(() {
      if (_videoPlayerController.value.position ==
          _videoPlayerController.value.duration) {
        widget.swiperController.next();
      }
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    if (_chewieController != null) {
      _chewieController!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return getVideoView();
  }

  Widget getVideoView() {
    return Stack(
      fit: StackFit.expand,
      children: [
        _chewieController != null &&
                _chewieController!.videoPlayerController.value.isInitialized
            ? FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: GestureDetector(
                    onDoubleTap: () {
                      if (!widget.item.isLiked) {
                        _liked = true;
                        if (widget.onLike != null) {
                          widget.onLike!(widget.item.url);
                        }
                        setState(() {});
                      }
                    },
                    child: Chewie(
                      controller: _chewieController!,
                    ),
                  ),
                ),
              )
            : const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 10),
                  Text('Loading...')
                ],
              ),
        if (_liked)
          const Center(
            child: LikeIcon(),
          ),
        if (widget.showProgressIndicator)
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: VideoProgressIndicator(
              _videoPlayerController,
              allowScrubbing: false,
              colors: const VideoProgressColors(
                backgroundColor: Colors.blueGrey,
                bufferedColor: Colors.blueGrey,
                playedColor: Colors.blueAccent,
              ),
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(bottom: 80),
          child: ScreenOptions(
            onClickMoreBtn: widget.onClickMoreBtn,
            onComment: widget.onComment,
            onFollow: widget.onFollow,
            onLike: widget.onLike,
            onShare: widget.onShare,
            showVerifiedTick: widget.showVerifiedTick,
            item: widget.item,
          ),
        )
      ],
    );
  }
}
