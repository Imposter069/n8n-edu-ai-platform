import 'package:flutter/material.dart';
import 'student_section.dart';
import 'engineering_section.dart';
import 'search_screen.dart';
import '../theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _buildHeader(context)),
            SliverToBoxAdapter(child: _buildSectionTitle('Browse Categories')),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverGrid(
                delegate: SliverChildListDelegate(_buildGridCards(context)),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 1.0,
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 30)),
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text('Hello, ',
                        style: TextStyle(
                            color: AppColors.textSecondary, fontSize: 15)),
                    const Text('student 👋',
                        style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 15,
                            fontWeight: FontWeight.w700)),
                  ],
                ),
                const SizedBox(height: 2),
                const Text('What will you learn today?',
                    style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 22,
                        fontWeight: FontWeight.w800)),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const SearchScreen())),
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.divider),
              ),
              child: const Icon(Icons.search_rounded,
                  color: AppColors.textPrimary, size: 22),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.divider),
            ),
            child: Stack(
              children: [
                const Center(
                    child: Icon(Icons.notifications_none_rounded,
                        color: AppColors.textPrimary, size: 22)),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: AppColors.accentGold,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.w700)),
          const Text('See all',
              style: TextStyle(
                  color: AppColors.accent,
                  fontSize: 13,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  List<Widget> _buildGridCards(BuildContext context) {
    final cards = [
      _CardData(
          'School\nEducation',
          Icons.school_rounded,
          const LinearGradient(
              colors: [Color(0xFF00D4FF), Color(0xFF006699)]),
              () => Navigator.push(context,
              MaterialPageRoute(builder: (_) => const StudentSection()))),
      _CardData(
          'Engineering',
          Icons.engineering_rounded,
          const LinearGradient(
              colors: [Color(0xFFFFB347), Color(0xFFCC6600)]),
              () => Navigator.push(context,
              MaterialPageRoute(builder: (_) => const EngineeringSection()))),
      _CardData(
          'Video\nLectures',
          Icons.play_circle_filled_rounded,
          const LinearGradient(
              colors: [Color(0xFF7C5CBF), Color(0xFF4A2B9A)]),
              () {}),
      _CardData(
          'E-Books',
          Icons.menu_book_rounded,
          const LinearGradient(
              colors: [Color(0xFF4ECDC4), Color(0xFF1A8C85)]),
              () {}),
      _CardData(
          'AI Tutor',
          Icons.smart_toy_rounded,
          const LinearGradient(
              colors: [Color(0xFFFF6B9D), Color(0xFFCC2255)]),
              () {}),
      _CardData(
          'Sample\nPapers',
          Icons.assignment_rounded,
          const LinearGradient(
              colors: [Color(0xFF56CCF2), Color(0xFF2F80ED)]),
              () {}),
    ];
    return cards.map((c) => _buildCategoryCard(c)).toList();
  }

  Widget _buildCategoryCard(_CardData data) {
    return GestureDetector(
      onTap: data.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.divider),
        ),
        child: Stack(
          children: [
            Positioned(
              right: -10,
              bottom: -10,
              child: Opacity(
                opacity: 0.08,

                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: data.gradient,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      gradient: data.gradient,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(data.icon, color: Colors.white, size: 24),
                  ),
                  const Spacer(),
                  Text(data.title,
                      style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          height: 1.3)),
                  const SizedBox(height: 4),
                  const Text('Explore →',
                      style: TextStyle(
                          color: AppColors.textSecondary, fontSize: 11)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardData {
  final String title;
  final IconData icon;
  final Gradient gradient;
  final VoidCallback onTap;
  _CardData(this.title, this.icon, this.gradient, this.onTap);
}