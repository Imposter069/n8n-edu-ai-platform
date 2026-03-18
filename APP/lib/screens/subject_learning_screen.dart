import 'package:flutter/material.dart';
import 'video_screen.dart';
import 'pdf_viewer_screen.dart';
import 'ai_tutor_screen.dart';
import '../theme/app_theme.dart';

class SubjectLearningScreen extends StatelessWidget {
  final String subjectName;
  const SubjectLearningScreen({super.key, required this.subjectName});

  @override
  Widget build(BuildContext context) {
    final resources = [
      _Resource('Video Lectures', 'Watch curated video lessons', Icons.play_circle_filled_rounded,
          const LinearGradient(colors: [Color(0xFF00D4FF), Color(0xFF006699)]),
          () => Navigator.push(context, MaterialPageRoute(builder: (_) => const VideoScreen(videoId: 'Kp2bYWRQylk')))),
      _Resource('Study Notes', 'Comprehensive topic-wise notes', Icons.description_rounded,
          const LinearGradient(colors: [Color(0xFF7C5CBF), Color(0xFF4A2B9A)]),
          () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PdfViewerScreen(
              title: 'Study Notes',
              pdfUrl: 'https://docs.google.com/gview?embedded=1&url=https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf')))),
      _Resource('E-Books', 'Digital textbooks & references', Icons.menu_book_rounded,
          const LinearGradient(colors: [Color(0xFF4ECDC4), Color(0xFF1A8C85)]),
          () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PdfViewerScreen(
              title: 'E-Book',
              pdfUrl: 'https://docs.google.com/gview?embedded=1&url=https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf')))),
      _Resource('Sample Papers', 'Practice with past papers', Icons.assignment_rounded,
          const LinearGradient(colors: [Color(0xFFFFB347), Color(0xFFCC6600)]),
          () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Sample Papers Coming Soon!'),
                  backgroundColor: AppColors.surface))),
      _Resource('AI Tutor', 'Get instant AI-powered help', Icons.smart_toy_rounded,
          const LinearGradient(colors: [Color(0xFFFF6B9D), Color(0xFFCC2255)]),
          () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AITutorScreen()))),
    ];

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            _buildSubjectBanner(),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 1.0,
                ),
                itemCount: resources.length,
                itemBuilder: (_, i) => _buildResourceCard(resources[i]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
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
          Text(subjectName,
              style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.w800)),
        ],
      ),
    );
  }

  Widget _buildSubjectBanner() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF1A3A5C), Color(0xFF112240)],
          ),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColors.divider),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Continue Learning $subjectName',
                      style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 14,
                          fontWeight: FontWeight.w700)),
                  const SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: 0.38,
                      backgroundColor: AppColors.divider,
                      valueColor: const AlwaysStoppedAnimation<Color>(AppColors.accent),
                      minHeight: 6,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text('38% complete · 12 of 32 topics',
                      style: TextStyle(color: AppColors.textSecondary, fontSize: 11)),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [AppColors.accent, Color(0xFF0090CC)]),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(Icons.play_arrow_rounded,
                  color: AppColors.primary, size: 24),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResourceCard(_Resource r) {
    return GestureDetector(
      onTap: r.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.divider),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  gradient: r.gradient,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(r.icon, color: Colors.white, size: 24),
              ),
              const Spacer(),
              Text(r.title,
                  style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w700)),
              const SizedBox(height: 4),
              Text(r.subtitle,
                  style: const TextStyle(
                      color: AppColors.textSecondary, fontSize: 10, height: 1.3)),
            ],
          ),
        ),
      ),
    );
  }
}

class _Resource {
  final String title, subtitle;
  final IconData icon;
  final Gradient gradient;
  final VoidCallback onTap;
  const _Resource(this.title, this.subtitle, this.icon, this.gradient, this.onTap);
}
