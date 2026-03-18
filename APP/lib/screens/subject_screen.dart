import 'package:flutter/material.dart';
import 'subject_learning_screen.dart';
import '../theme/app_theme.dart';

class SubjectScreen extends StatelessWidget {
  final int classNumber;
  const SubjectScreen({super.key, required this.classNumber});

  @override
  Widget build(BuildContext context) {
    final subjects = [
      {'name': 'Mathematics', 'icon': Icons.calculate_rounded, 'color': const Color(0xFF00D4FF), 'topics': '24 topics'},
      {'name': 'Physics', 'icon': Icons.bolt_rounded, 'color': const Color(0xFFFFB347), 'topics': '18 topics'},
      {'name': 'Chemistry', 'icon': Icons.science_rounded, 'color': const Color(0xFF4ECDC4), 'topics': '22 topics'},
      {'name': 'Biology', 'icon': Icons.biotech_rounded, 'color': const Color(0xFF7C5CBF), 'topics': '20 topics'},
      {'name': 'English', 'icon': Icons.menu_book_rounded, 'color': const Color(0xFFFF6B9D), 'topics': '15 topics'},
    ];

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Class $classNumber',
                          style: const TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 20,
                              fontWeight: FontWeight.w800)),
                      const Text('Choose a subject',
                          style: TextStyle(
                              color: AppColors.textSecondary, fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: subjects.length,
                itemBuilder: (_, i) {
                  final s = subjects[i];
                  return GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(
                        builder: (_) => SubjectLearningScreen(subjectName: s['name'] as String))),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: AppColors.divider),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: (s['color'] as Color).withOpacity(0.15),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Icon(s['icon'] as IconData,
                                color: s['color'] as Color, size: 24),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(s['name'] as String,
                                    style: const TextStyle(
                                        color: AppColors.textPrimary,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700)),
                                const SizedBox(height: 3),
                                Text(s['topics'] as String,
                                    style: const TextStyle(
                                        color: AppColors.textSecondary,
                                        fontSize: 11)),
                              ],
                            ),
                          ),
                          const Icon(Icons.arrow_forward_ios_rounded,
                              color: AppColors.textSecondary, size: 14),
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
}
