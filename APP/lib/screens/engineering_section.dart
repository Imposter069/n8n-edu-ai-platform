import 'package:flutter/material.dart';
import 'subject_learning_screen.dart';
import '../theme/app_theme.dart';

class EngineeringSection extends StatelessWidget {
  const EngineeringSection({super.key});

  final List<Map<String, dynamic>> courses = const [
    {'name': 'C Programming', 'video': 'KJgsSFOSQv0', 'icon': Icons.terminal_rounded, 'color': Color(0xFF00D4FF), 'lessons': '32 lessons'},
    {'name': 'C++ Programming', 'video': 'vLnPwxZdW4Y', 'icon': Icons.code_rounded, 'color': Color(0xFFFFB347), 'lessons': '45 lessons'},
    {'name': 'Python Programming', 'video': 'rfscVS0vtbw', 'icon': Icons.integration_instructions_rounded, 'color': Color(0xFF7C5CBF), 'lessons': '38 lessons'},
    {'name': 'Data Structures', 'video': 'RBSGKlAvoiM', 'icon': Icons.account_tree_rounded, 'color': Color(0xFF4ECDC4), 'lessons': '56 lessons'},
    {'name': 'Operating Systems', 'video': '26QPDBe-NB8', 'icon': Icons.memory_rounded, 'color': Color(0xFFFF6B9D), 'lessons': '42 lessons'},
    {'name': 'NPTEL Courses', 'video': '0IAPZzGSbME', 'icon': Icons.play_lesson_rounded, 'color': Color(0xFF56CCF2), 'lessons': '60+ lessons'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: courses.length,
                itemBuilder: (_, i) {
                  final c = courses[i];
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SubjectLearningScreen(
                          subjectName: c['name'],
                        ),
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 14),
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.divider),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 52,
                            height: 52,
                            decoration: BoxDecoration(
                              color: (c['color'] as Color).withOpacity(0.15),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Icon(c['icon'] as IconData,
                                color: c['color'] as Color, size: 26),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(c['name'],
                                    style: const TextStyle(
                                        color: AppColors.textPrimary,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700)),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    const Icon(Icons.play_circle_outline,
                                        color: AppColors.textSecondary, size: 12),
                                    const SizedBox(width: 4),
                                    Text(c['lessons'],
                                        style: const TextStyle(
                                            color: AppColors.textSecondary,
                                            fontSize: 11)),
                                    const SizedBox(width: 12),
                                    const Icon(Icons.star_rounded,
                                        color: AppColors.accentGold, size: 12),
                                    const SizedBox(width: 3),
                                    const Text('4.8',
                                        style: TextStyle(
                                            color: AppColors.textSecondary,
                                            fontSize: 11)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  (c['color'] as Color),
                                  (c['color'] as Color).withOpacity(0.7),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text('Start',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700)),
                          ),
                        ],
                      ),
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

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.divider),
              ),
              child: const Icon(Icons.arrow_back_ios_new_rounded,
                  color: AppColors.textPrimary, size: 16),
            ),
          ),
          const SizedBox(width: 14),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Engineering (BTech)',
                  style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.w800)),
              Text('Core programming subjects',
                  style: TextStyle(
                      color: AppColors.textSecondary, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}
