import 'dart:async';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'video_screen.dart';
import 'pdf_viewer_screen.dart';
import 'ai_tutor_screen.dart';

import '../theme/app_theme.dart';
import 'supabase_service.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../screens/watch_history_service.dart';

class SubjectLearningScreen
    extends StatefulWidget {

  final String subjectName;

  final int subjectId;

  const SubjectLearningScreen({

    super.key,

    required this.subjectName,

    required this.subjectId,
  });

  @override
  State<SubjectLearningScreen>
  createState() =>
      _SubjectLearningScreenState();
}

class _SubjectLearningScreenState
    extends State<SubjectLearningScreen> {

  final service = SupabaseService();

  final supabase =
      Supabase.instance.client;

  List<dynamic> resources = [];

  bool isLoading = true;

  StreamSubscription?
  resourceStream;

  @override
  void initState() {

    super.initState();

    loadResources();

    listenRealtime();
  }

  // =====================================
  // LOAD RESOURCES
  // =====================================
  Future<void> loadResources() async {

    try {

      final data =
      await service.fetchResources(
        widget.subjectId,
      );

      setState(() {

        resources = data;

        isLoading = false;
      });

    } catch (e) {

      print("ERROR: $e");

      setState(() {

        isLoading = false;
      });
    }
  }

  // =====================================
  // REALTIME
  // =====================================
  void listenRealtime() {

    resourceStream = supabase

        .from('resources')

        .stream(
      primaryKey: ['id'],
    )

        .eq(
      'subject_id',
      widget.subjectId,
    )

        .listen((data) {

      setState(() {

        resources = data;
      });
    });
  }

  // =====================================
  // DISPOSE
  // =====================================
  @override
  void dispose() {

    resourceStream?.cancel();

    super.dispose();
  }

  // =====================================
  // ICONS
  // =====================================
  IconData getIcon(String type) {

    switch(type) {

      case "video":
        return Icons.play_circle_filled_rounded;

      case "ebook":
        return Icons.menu_book_rounded;

      case "notes":
        return Icons.description_rounded;

      case "sample_paper":
        return Icons.assignment_rounded;

      default:
        return Icons.folder;
    }
  }

  // =====================================
  // GRADIENTS
  // =====================================
  Gradient getGradient(String type) {

    switch(type) {

      case "video":

        return const LinearGradient(
          colors: [
            Color(0xFF00D4FF),
            Color(0xFF006699),
          ],
        );

      case "notes":

        return const LinearGradient(
          colors: [
            Color(0xFF7C5CBF),
            Color(0xFF4A2B9A),
          ],
        );

      case "ebook":

        return const LinearGradient(
          colors: [
            Color(0xFF4ECDC4),
            Color(0xFF1A8C85),
          ],
        );

      case "sample_paper":

        return const LinearGradient(
          colors: [
            Color(0xFFFFB347),
            Color(0xFFCC6600),
          ],
        );

      default:

        return const LinearGradient(
          colors: [
            Colors.grey,
            Colors.black54,
          ],
        );
    }
  }

  // =====================================
  // OPEN RESOURCE
  // =====================================
  Future<void> openResource(dynamic item) async {

    final type =
    item['resource_type'];

    // =====================================
    // VIDEO
    // =====================================

    if (type == "video") {

      final url =
      item['video_url'];

      if (url != null &&
          url.toString().isNotEmpty) {

        // ===============================
        // SAVE WATCH HISTORY
        // ===============================

        await WatchHistoryService
            .saveHistory(

          userEmail:

          Supabase.instance.client
              .auth.currentUser
              ?.email ?? '',

          title:
          item['title'],

          type:
          'video',

          url:
          url,
        );

        // ===============================
        // OPEN VIDEO
        // ===============================

        final videoId =
        YoutubePlayer.convertUrlToId(
          url,
        );

        if (videoId != null) {

          Navigator.push(

            context,

            MaterialPageRoute(

              builder: (_) =>
                  VideoScreen(
                    videoId: videoId,
                  ),
            ),
          );
        }
      }
    }

    // =====================================
    // PDF
    // =====================================

    else {

      final pdfUrl =
      item['pdf_url'];

      if (pdfUrl != null &&
          pdfUrl.toString().isNotEmpty) {

        Navigator.push(

          context,

          MaterialPageRoute(

            builder: (_) =>
                PdfViewerScreen(

                  title:
                  item['title'],

                  pdfUrl: pdfUrl,
                ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      AppColors.primary,

      body: SafeArea(

        child: Column(

          children: [

            _buildHeader(context),

            _buildSubjectBanner(),

            // =====================
            // LOADING
            // =====================
            if (isLoading)

              const Expanded(

                child: Center(

                  child:
                  CircularProgressIndicator(),
                ),
              )

            // =====================
            // EMPTY
            // =====================
            else if (resources.isEmpty)

              const Expanded(

                child: Center(

                  child: Text(

                    "No Resources Found",

                    style: TextStyle(

                      color:
                      AppColors.textPrimary,

                      fontSize: 18,
                    ),
                  ),
                ),
              )

            // =====================
            // RESOURCES
            // =====================
            else

              Expanded(

                child: GridView.builder(

                  padding:
                  const EdgeInsets.all(20),

                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(

                    crossAxisCount: 2,

                    crossAxisSpacing: 14,

                    mainAxisSpacing: 14,

                    childAspectRatio: 1.0,
                  ),

                  itemCount:
                  resources.length + 1,

                  itemBuilder:
                      (_, i) {

                    // =================
                    // AI TUTOR CARD
                    // =================
                    if (i ==
                        resources.length) {

                      return _buildResourceCard(

                        title:
                        "AI Tutor",

                        subtitle:
                        "Get instant AI-powered help",

                        icon:
                        Icons.smart_toy_rounded,

                        gradient:
                        const LinearGradient(

                          colors: [

                            Color(0xFFFF6B9D),

                            Color(0xFFCC2255),
                          ],
                        ),

                        onTap: () {

                          Navigator.push(

                            context,

                            MaterialPageRoute(

                              builder: (_) =>
                              const AITutorScreen(),
                            ),
                          );
                        },
                      );
                    }

                    final item =
                    resources[i];

                    return _buildResourceCard(

                      title:
                      item['title'],

                      subtitle:
                      item['description']
                          ?? '',

                      icon:
                      getIcon(
                        item[
                        'resource_type'],
                      ),

                      gradient:
                      getGradient(
                        item[
                        'resource_type'],
                      ),

                      onTap: () =>
                          openResource(item),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  // =====================================
  // HEADER
  // =====================================
  Widget _buildHeader(
      BuildContext context) {

    return Padding(

      padding:
      const EdgeInsets.fromLTRB(
        20,
        20,
        20,
        0,
      ),

      child: Row(

        children: [

          GestureDetector(

            onTap: () =>
                Navigator.pop(context),

            child: Container(

              width: 40,

              height: 40,

              decoration: BoxDecoration(

                color:
                AppColors.surface,

                borderRadius:
                BorderRadius.circular(
                  12,
                ),

                border: Border.all(
                  color:
                  AppColors.divider,
                ),
              ),

              child: const Icon(

                Icons.arrow_back_ios_new_rounded,

                color:
                AppColors.textPrimary,

                size: 16,
              ),
            ),
          ),

          const SizedBox(width: 14),

          Text(

            widget.subjectName,

            style: const TextStyle(

              color:
              AppColors.textPrimary,

              fontSize: 20,

              fontWeight:
              FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  // =====================================
  // SUBJECT BANNER
  // =====================================
  Widget _buildSubjectBanner() {

    return Padding(

      padding:
      const EdgeInsets.fromLTRB(
        20,
        16,
        20,
        0,
      ),

      child: Container(

        padding:
        const EdgeInsets.all(18),

        decoration: BoxDecoration(

          gradient:
          const LinearGradient(

            colors: [

              Color(0xFF1A3A5C),

              Color(0xFF112240),
            ],
          ),

          borderRadius:
          BorderRadius.circular(
            18,
          ),

          border: Border.all(
            color: AppColors.divider,
          ),
        ),

        child: Row(

          children: [

            Expanded(

              child: Column(

                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  Text(

                    'Continue Learning ${widget.subjectName}',

                    style:
                    const TextStyle(

                      color:
                      AppColors.textPrimary,

                      fontSize: 14,

                      fontWeight:
                      FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 10),

                  ClipRRect(

                    borderRadius:
                    BorderRadius.circular(
                      4,
                    ),

                    child:
                    LinearProgressIndicator(

                      value: 0.38,

                      backgroundColor:
                      AppColors.divider,

                      valueColor:
                      const AlwaysStoppedAnimation<Color>(
                        AppColors.accent,
                      ),

                      minHeight: 6,
                    ),
                  ),

                  const SizedBox(height: 6),

                  const Text(

                    '38% complete · 12 of 32 topics',

                    style: TextStyle(

                      color:
                      AppColors.textSecondary,

                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 12),

            Container(

              width: 44,

              height: 44,

              decoration: BoxDecoration(

                gradient:
                const LinearGradient(

                  colors: [

                    AppColors.accent,

                    Color(0xFF0090CC),
                  ],
                ),

                borderRadius:
                BorderRadius.circular(
                  14,
                ),
              ),

              child: const Icon(

                Icons.play_arrow_rounded,

                color:
                AppColors.primary,

                size: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // =====================================
  // RESOURCE CARD
  // =====================================
  Widget _buildResourceCard({

    required String title,

    required String subtitle,

    required IconData icon,

    required Gradient gradient,

    required VoidCallback onTap,

  }) {

    return GestureDetector(

      onTap: onTap,

      child: Container(

        decoration: BoxDecoration(

          color: AppColors.surface,

          borderRadius:
          BorderRadius.circular(
            20,
          ),

          border: Border.all(
            color: AppColors.divider,
          ),
        ),

        child: Padding(

          padding:
          const EdgeInsets.all(18),

          child: Column(

            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              Container(

                width: 48,

                height: 48,

                decoration:
                BoxDecoration(

                  gradient: gradient,

                  borderRadius:
                  BorderRadius.circular(
                    14,
                  ),
                ),

                child: Icon(

                  icon,

                  color: Colors.white,

                  size: 24,
                ),
              ),

              const Spacer(),

              Text(

                title,

                style:
                const TextStyle(

                  color:
                  AppColors.textPrimary,

                  fontSize: 14,

                  fontWeight:
                  FontWeight.w700,
                ),
              ),

              const SizedBox(height: 4),

              Text(

                subtitle,

                style:
                const TextStyle(

                  color:
                  AppColors.textSecondary,

                  fontSize: 10,

                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
