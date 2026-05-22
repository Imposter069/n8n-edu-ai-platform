import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../screens//watch_history_service.dart';

class WatchHistoryScreen extends StatefulWidget {

  const WatchHistoryScreen({super.key});

  @override
  State<WatchHistoryScreen> createState() =>
      _WatchHistoryScreenState();
}

class _WatchHistoryScreenState
    extends State<WatchHistoryScreen> {

  List<Map<String, dynamic>> history = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    loadHistory();
  }

  Future<void> loadHistory() async {

    final data =
    await WatchHistoryService.getHistory(

      'kaleayush2006@gmail.com',
    );

    setState(() {

      history = data;

      isLoading = false;
    });
  }

  Future<void> openVideo(String url) async {

    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {

      await launchUrl(

        uri,

        mode:
        LaunchMode.externalApplication,
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      const Color(0xFF001B44),

      appBar: AppBar(

        backgroundColor:
        Colors.transparent,

        elevation: 0,

        title: const Text(
          'Watch History',
        ),
      ),

      body: isLoading

          ? const Center(
        child:
        CircularProgressIndicator(),
      )

          : history.isEmpty

          ? const Center(

        child: Text(

          'No Watch History',

          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      )

          : ListView.builder(

        itemCount: history.length,

        itemBuilder: (context, index) {

          final item = history[index];

          return Container(

            margin: const EdgeInsets.all(12),

            padding: const EdgeInsets.all(16),

            decoration: BoxDecoration(

              color:
              const Color(0xFF0A2A66),

              borderRadius:
              BorderRadius.circular(20),
            ),

            child: ListTile(

              leading: const Icon(

                Icons.history,

                color: Colors.cyan,

                size: 32,
              ),

              title: Text(

                item['title'],

                style: const TextStyle(

                  color: Colors.white,

                  fontWeight:
                  FontWeight.bold,
                ),
              ),

              subtitle: Text(

                item['url'],

                maxLines: 1,

                overflow:
                TextOverflow.ellipsis,

                style: const TextStyle(
                  color: Colors.white70,
                ),
              ),

              trailing: const Icon(

                Icons.play_circle_fill,

                color: Colors.white,
              ),

              onTap: () {

                openVideo(
                  item['url'],
                );
              },
            ),
          );
        },
      ),
    );
  }
}