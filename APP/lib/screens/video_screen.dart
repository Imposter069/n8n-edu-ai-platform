import 'package:flutter/material.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../theme/app_theme.dart';

class VideoScreen extends StatefulWidget {

  final String videoId;

  const VideoScreen({

    super.key,

    required this.videoId,
  });

  @override
  State<VideoScreen> createState() =>
      _VideoScreenState();
}

class _VideoScreenState
    extends State<VideoScreen> {

  late YoutubePlayerController
  controller;

  @override
  void initState() {

    super.initState();

    controller =
        YoutubePlayerController(

          initialVideoId:
          widget.videoId,

          flags:
          const YoutubePlayerFlags(

            autoPlay: true,

            mute: false,
          ),
        );
  }

  @override
  void dispose() {

    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      AppColors.primary,

      appBar: AppBar(

        backgroundColor:
        AppColors.primary,

        elevation: 0,

        title: const Text(

          "Video Lecture",

          style: TextStyle(
            color:
            AppColors.textPrimary,
          ),
        ),
      ),

      body: Column(

        children: [

          YoutubePlayer(
            controller: controller,
            showVideoProgressIndicator:
            true,
          ),

          const SizedBox(height: 20),

          const Padding(

            padding:
            EdgeInsets.all(16),

            child: Text(

              "Watch carefully and complete your notes.",

              style: TextStyle(

                color:
                AppColors.textPrimary,

                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
