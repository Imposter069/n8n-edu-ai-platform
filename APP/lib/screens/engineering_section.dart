import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../screens//watch_history_service.dart';
import '../theme/app_theme.dart';

class EngineeringSection extends StatelessWidget {

  const EngineeringSection({super.key});

  // =========================================
  // COURSES
  // =========================================

  final List<Map<String, dynamic>> courses = const [

    {
      'name': 'C Programming',

      'url':
      'https://www.youtube.com/watch?v=irqbmMNs2Bo&t=11441s',

      'icon': Icons.terminal_rounded,

      'color': Color(0xFF00D4FF),

      'lessons': '32 lessons',
    },

    {
      'name': 'C++ Programming',

      'url':
      'https://www.youtube.com/watch?v=e7sAf4SbS_g',

      'icon': Icons.code_rounded,

      'color': Color(0xFFFFB347),

      'lessons': '45 lessons',
    },

    {
      'name': 'Python Programming',

      'url':
      'https://www.youtube.com/watch?v=K5KVEU3aaeQ&t=3s',

      'icon': Icons.integration_instructions_rounded,

      'color': Color(0xFF7C5CBF),

      'lessons': '38 lessons',
    },

    {
      'name': 'Data Structures',

      'url':
      'https://www.youtube.com/watch?v=MdG0Vw9f1A4',

      'icon': Icons.account_tree_rounded,

      'color': Color(0xFF4ECDC4),

      'lessons': '56 lessons',
    },

    {
      'name': 'Operating Systems',

      'url':
      'https://www.youtube.com/watch?v=9mDK3C2em7M&t=365s',

      'icon': Icons.memory_rounded,

      'color': Color(0xFFFF6B9D),

      'lessons': '42 lessons',
    },

    {
      'name': 'NPTEL Courses',

      'url':
      'https://www.youtube.com/watch?v=t9WKOcRB63Q&list=PLJ5C_6qdAvBFzL9su5J-FX8x80BMhkPy1',

      'icon': Icons.play_lesson_rounded,

      'color': Color(0xFF56CCF2),

      'lessons': '60+ lessons',
    },
  ];

  // =========================================
  // OPEN YOUTUBE URL
  // =========================================

  Future<void> openUrl(String url) async {

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
      AppColors.primary,

      body: SafeArea(

        child: Column(

          children: [

            _buildHeader(context),

            Expanded(

              child: ListView.builder(

                padding:
                const EdgeInsets.all(20),

                itemCount:
                courses.length,

                itemBuilder: (_, i) {

                  final c = courses[i];

                  return Container(

                    margin:
                    const EdgeInsets.only(
                      bottom: 14,
                    ),

                    padding:
                    const EdgeInsets.all(18),

                    decoration: BoxDecoration(

                      color:
                      AppColors.surface,

                      borderRadius:
                      BorderRadius.circular(
                        20,
                      ),

                      border: Border.all(
                        color:
                        AppColors.divider,
                      ),
                    ),

                    child: Row(

                      children: [

                        // ===================================
                        // ICON
                        // ===================================

                        Container(

                          width: 52,

                          height: 52,

                          decoration: BoxDecoration(

                            color:
                            (c['color'] as Color)
                                .withOpacity(0.15),

                            borderRadius:
                            BorderRadius.circular(
                              16,
                            ),
                          ),

                          child: Icon(

                            c['icon']
                            as IconData,

                            color:
                            c['color']
                            as Color,

                            size: 26,
                          ),
                        ),

                        const SizedBox(width: 16),

                        // ===================================
                        // TEXT
                        // ===================================

                        Expanded(

                          child: Column(

                            crossAxisAlignment:
                            CrossAxisAlignment.start,

                            children: [

                              Text(

                                c['name'],

                                style:
                                const TextStyle(

                                  color:
                                  AppColors.textPrimary,

                                  fontSize: 15,

                                  fontWeight:
                                  FontWeight.w700,
                                ),
                              ),

                              const SizedBox(height: 5),

                              Row(

                                children: [

                                  const Icon(

                                    Icons.play_circle_outline,

                                    color:
                                    AppColors.textSecondary,

                                    size: 12,
                                  ),

                                  const SizedBox(width: 4),

                                  Text(

                                    c['lessons'],

                                    style:
                                    const TextStyle(

                                      color:
                                      AppColors.textSecondary,

                                      fontSize: 11,
                                    ),
                                  ),

                                  const SizedBox(width: 12),

                                  const Icon(

                                    Icons.star_rounded,

                                    color:
                                    AppColors.accentGold,

                                    size: 12,
                                  ),

                                  const SizedBox(width: 3),

                                  const Text(

                                    '4.8',

                                    style:
                                    TextStyle(

                                      color:
                                      AppColors.textSecondary,

                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // ===================================
                        // START BUTTON
                        // ===================================

                        GestureDetector(

                          onTap: () async {

                            // ===============================
                            // SAVE WATCH HISTORY
                            // ===============================

                            await WatchHistoryService
                                .saveHistory(

                              userEmail:

                              Supabase.instance
                                  .client
                                  .auth
                                  .currentUser
                                  ?.email ?? '',

                              title:
                              c['name'],

                              type:
                              'video',

                              url:
                              c['url'],
                            );

                            // ===============================
                            // OPEN VIDEO
                            // ===============================

                            openUrl(
                              c['url'],
                            );
                          },

                          child: Container(

                            padding:
                            const EdgeInsets.symmetric(

                              horizontal: 16,

                              vertical: 10,
                            ),

                            decoration: BoxDecoration(

                              gradient:
                              LinearGradient(

                                colors: [

                                  c['color']
                                  as Color,

                                  (c['color']
                                  as Color)
                                      .withOpacity(
                                    0.7,
                                  ),
                                ],
                              ),

                              borderRadius:
                              BorderRadius.circular(
                                10,
                              ),
                            ),

                            child: const Text(

                              'Start',

                              style: TextStyle(

                                color: Colors.white,

                                fontSize: 11,

                                fontWeight:
                                FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // =========================================
  // HEADER
  // =========================================

  Widget _buildHeader(BuildContext context) {

    return Padding(

      padding:
      const EdgeInsets.fromLTRB(
        20,
        20,
        20,
        8,
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

          const Column(

            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              Text(

                'Engineering (BTech)',

                style: TextStyle(

                  color:
                  AppColors.textPrimary,

                  fontSize: 20,

                  fontWeight:
                  FontWeight.w800,
                ),
              ),

              Text(

                'Core programming subjects',

                style: TextStyle(

                  color:
                  AppColors.textSecondary,

                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
