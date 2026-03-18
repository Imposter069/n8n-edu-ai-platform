import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  String query = '';

  final List<Map<String, dynamic>> allCourses = [
    {'name': 'Mathematics Class 10', 'category': 'School', 'icon': Icons.calculate_rounded, 'color': Color(0xFF00D4FF)},
    {'name': 'Physics for JEE', 'category': 'Engineering', 'icon': Icons.bolt_rounded, 'color': Color(0xFFFFB347)},
    {'name': 'Chemistry NEET Prep', 'category': 'Medical', 'icon': Icons.science_rounded, 'color': Color(0xFF4ECDC4)},
    {'name': 'English Grammar', 'category': 'School', 'icon': Icons.menu_book_rounded, 'color': Color(0xFF7C5CBF)},
    {'name': 'Python Programming', 'category': 'CS', 'icon': Icons.code_rounded, 'color': Color(0xFFFF6B9D)},
    {'name': 'Biology Class 12', 'category': 'School', 'icon': Icons.biotech_rounded, 'color': Color(0xFF56CCF2)},
  ];

  final List<String> trending = ['JEE 2025', 'CBSE Class 10', 'NEET Biology', 'Python', 'Calculus'];

  List<Map<String, dynamic>> get filtered =>
      query.isEmpty ? [] : allCourses.where((c) =>
          c['name'].toLowerCase().contains(query.toLowerCase()) ||
          c['category'].toLowerCase().contains(query.toLowerCase())).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
          children: [
            _buildSearchBar(context),
            Expanded(
              child: query.isEmpty ? _buildDiscovery() : _buildResults(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
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
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.divider),
              ),
              child: TextField(
                controller: _controller,
                autofocus: true,
                onChanged: (v) => setState(() => query = v),
                style: const TextStyle(color: AppColors.textPrimary, fontSize: 14),
                decoration: const InputDecoration(
                  hintText: 'Search courses, topics...',
                  hintStyle: TextStyle(color: AppColors.textSecondary),
                  prefixIcon: Icon(Icons.search_rounded,
                      color: AppColors.textSecondary, size: 20),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDiscovery() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          const Text('Trending Searches',
              style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w700)),
          const SizedBox(height: 14),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: trending.map((t) => GestureDetector(
              onTap: () => setState(() { query = t; _controller.text = t; }),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.divider),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.trending_up_rounded,
                        color: AppColors.accent, size: 14),
                    const SizedBox(width: 6),
                    Text(t,
                        style: const TextStyle(
                            color: AppColors.textPrimary, fontSize: 13)),
                  ],
                ),
              ),
            )).toList(),
          ),
          const SizedBox(height: 28),
          const Text('All Courses',
              style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w700)),
          const SizedBox(height: 14),
          ...allCourses.map((c) => _courseListItem(c)),
        ],
      ),
    );
  }

  Widget _buildResults() {
    if (filtered.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.search_off_rounded,
                color: AppColors.textSecondary, size: 56),
            const SizedBox(height: 16),
            Text('No results for "$query"',
                style: const TextStyle(
                    color: AppColors.textSecondary, fontSize: 14)),
          ],
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: filtered.length,
      itemBuilder: (_, i) => _courseListItem(filtered[i]),
    );
  }

  Widget _courseListItem(Map<String, dynamic> c) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.divider),
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: (c['color'] as Color).withOpacity(0.15),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(c['icon'] as IconData, color: c['color'] as Color, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(c['name'],
                    style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 3),
                Text(c['category'],
                    style: const TextStyle(
                        color: AppColors.textSecondary, fontSize: 11)),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios_rounded,
              color: AppColors.textSecondary, size: 14),
        ],
      ),
    );
  }
}
