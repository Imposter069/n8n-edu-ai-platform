import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ResourceListScreen extends StatefulWidget {

  final String resourceType;
  final String title;

  const ResourceListScreen({

    super.key,

    required this.resourceType,

    required this.title,
  });

  @override
  State<ResourceListScreen> createState() =>
      _ResourceListScreenState();
}

class _ResourceListScreenState
    extends State<ResourceListScreen> {

  final supabase = Supabase.instance.client;

  List resources = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    loadResources();
  }

  // =========================================
  // LOAD RESOURCES
  // =========================================

  Future<void> loadResources() async {

    final data = await supabase

        .from('resources')

        .select()

        .eq(
      'resource_type',
      widget.resourceType,
    );

    setState(() {

      resources = data;

      isLoading = false;
    });
  }

  // =========================================
  // OPEN URL
  // =========================================

  Future<void> openUrl(String url) async {

    final uri = Uri.parse(url);

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
      const Color(0xFF081B33),

      appBar: AppBar(

        backgroundColor:
        const Color(0xFF081B33),

        title: Text(widget.title),
      ),

      body:

      isLoading

          ? const Center(
        child:
        CircularProgressIndicator(),
      )

          : resources.isEmpty

          ? const Center(

        child: Text(

          "No Resources Found",

          style: TextStyle(
            color: Colors.white,
          ),
        ),
      )

          : ListView.builder(

        itemCount: resources.length,

        padding:
        const EdgeInsets.all(16),

        itemBuilder: (context, index) {

          final item = resources[index];

          return Container(

            margin:
            const EdgeInsets.only(
              bottom: 16,
            ),

            padding:
            const EdgeInsets.all(16),

            decoration: BoxDecoration(

              color:
              const Color(0xFF10284A),

              borderRadius:
              BorderRadius.circular(20),
            ),

            child: Column(

              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Text(

                  item['title'] ?? '',

                  style: const TextStyle(

                    color: Colors.white,

                    fontSize: 20,

                    fontWeight:
                    FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Text(

                  item['description'] ?? '',

                  style: const TextStyle(
                    color: Colors.white70,
                  ),
                ),

                const SizedBox(height: 20),

                // VIDEO BUTTON

                if (item['video_url'] != null &&
                    item['video_url'] != '')

                  SizedBox(

                    width: double.infinity,

                    child: ElevatedButton(

                      onPressed: () {

                        openUrl(
                          item['video_url'],
                        );
                      },

                      child:
                      const Text(
                        "Open Video",
                      ),
                    ),
                  ),

                const SizedBox(height: 10),

                // PDF BUTTON

                if (item['pdf_url'] != null &&
                    item['pdf_url'] != '')

                  SizedBox(

                    width: double.infinity,

                    child: ElevatedButton(

                      onPressed: () {

                        openUrl(
                          item['pdf_url'],
                        );
                      },

                      child:
                      const Text(
                        "Open PDF",
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}