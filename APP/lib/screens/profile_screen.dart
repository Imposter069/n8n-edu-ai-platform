import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../theme/app_theme.dart';
import 'login_screen.dart';
import 'watch_history_screen.dart';

class ProfileScreen extends StatelessWidget {

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final user =
        Supabase.instance.client.auth.currentUser;

    final String userName =

        user?.userMetadata?['name']
            ?.toString() ??

            'Student';

    final String userEmail =

        user?.email ??
            'No Email';

    final String initials =

    userName.isNotEmpty

        ? userName
        .split(' ')
        .map((e) => e[0])
        .take(2)
        .join()
        .toUpperCase()

        : 'ST';

    return Scaffold(

      backgroundColor: AppColors.primary,

      body: SafeArea(

        child: SingleChildScrollView(

          child: Column(

            children: [

              _buildHeader(

                context,

                userName,

                userEmail,

                initials,
              ),

              _buildStats(),

              // =====================================
              // MY LEARNING
              // =====================================

              _buildSection(

                context,

                'My Learning',

                [

                  _MenuItem(

                    Icons.bookmark_rounded,

                    'Saved Courses',

                    '12 courses',

                    const Color(0xFF00D4FF),
                  ),

                  _MenuItem(

                    Icons.history_rounded,

                    'Watch History',

                    'Recently watched videos',

                    const Color(0xFFFFB347),
                  ),

                  _MenuItem(

                    Icons.emoji_events_rounded,

                    'Achievements',

                    '8 badges',

                    const Color(0xFFFFD700),
                  ),
                ],
              ),

              // =====================================
              // ACCOUNT
              // =====================================

              _buildSection(

                context,

                'Account',

                [

                  _MenuItem(

                    Icons.notifications_rounded,

                    'Notifications',

                    'Manage alerts',

                    const Color(0xFF7C5CBF),
                  ),

                  _MenuItem(

                    Icons.lock_rounded,

                    'Privacy & Security',

                    '',

                    const Color(0xFF4ECDC4),
                  ),

                  _MenuItem(

                    Icons.help_rounded,

                    'Help & Support',

                    '',

                    const Color(0xFF56CCF2),
                  ),
                ],
              ),

              // =====================================
              // SIGN OUT
              // =====================================

              Padding(

                padding:
                const EdgeInsets.fromLTRB(
                    20,
                    8,
                    20,
                    30),

                child: GestureDetector(

                  onTap: () async {

                    await Supabase.instance.client
                        .auth
                        .signOut();

                    Navigator.pushAndRemoveUntil(

                      context,

                      MaterialPageRoute(

                        builder: (_) =>
                        const LoginScreen(),
                      ),

                          (_) => false,
                    );
                  },

                  child: Container(

                    width: double.infinity,

                    padding:
                    const EdgeInsets.symmetric(
                      vertical: 16,
                    ),

                    decoration: BoxDecoration(

                      color: AppColors.surface,

                      borderRadius:
                      BorderRadius.circular(16),

                      border: Border.all(

                        color:
                        Colors.red.withOpacity(0.3),
                      ),
                    ),

                    child: const Row(

                      mainAxisAlignment:
                      MainAxisAlignment.center,

                      children: [

                        Icon(

                          Icons.logout_rounded,

                          color: Colors.redAccent,

                          size: 18,
                        ),

                        SizedBox(width: 8),

                        Text(

                          'Sign Out',

                          style: TextStyle(

                            color: Colors.redAccent,

                            fontWeight:
                            FontWeight.w700,

                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // =====================================
  // HEADER
  // =====================================

  Widget _buildHeader(

      BuildContext context,

      String userName,

      String userEmail,

      String initials,
      ) {

    return Container(

      padding: const EdgeInsets.all(24),

      child: Column(

        children: [

          Stack(

            children: [

              Container(

                width: 90,

                height: 90,

                decoration: BoxDecoration(

                  gradient: const LinearGradient(

                    colors: [

                      AppColors.accent,

                      AppColors.accentPurple,
                    ],
                  ),

                  shape: BoxShape.circle,

                  boxShadow: [

                    BoxShadow(

                      color:
                      AppColors.accent.withOpacity(0.4),

                      blurRadius: 20,

                      spreadRadius: 2,
                    ),
                  ],
                ),

                child: Center(

                  child: Text(

                    initials,

                    style: const TextStyle(

                      color: AppColors.primary,

                      fontSize: 28,

                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),

              Positioned(

                bottom: 0,

                right: 0,

                child: Container(

                  width: 26,

                  height: 26,

                  decoration: BoxDecoration(

                    color: AppColors.accentGold,

                    shape: BoxShape.circle,

                    border: Border.all(

                      color: AppColors.primary,

                      width: 2,
                    ),
                  ),

                  child: const Icon(

                    Icons.edit,

                    color: AppColors.primary,

                    size: 13,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          Text(

            userName,

            style: const TextStyle(

              color: AppColors.textPrimary,

              fontSize: 22,

              fontWeight: FontWeight.w800,
            ),
          ),

          const SizedBox(height: 4),

          Text(

            userEmail,

            style: const TextStyle(

              color: AppColors.textSecondary,

              fontSize: 13,
            ),
          ),

          const SizedBox(height: 12),

          Container(

            padding:
            const EdgeInsets.symmetric(

              horizontal: 16,

              vertical: 8,
            ),

            decoration: BoxDecoration(

              color:
              AppColors.accent.withOpacity(0.12),

              borderRadius:
              BorderRadius.circular(20),

              border: Border.all(

                color:
                AppColors.accent.withOpacity(0.3),
              ),
            ),

            child: const Row(

              mainAxisSize: MainAxisSize.min,

              children: [

                Icon(

                  Icons.school_rounded,

                  color: AppColors.accent,

                  size: 14,
                ),

                SizedBox(width: 6),

                Text(

                  'Smart Education User',

                  style: TextStyle(

                    color: AppColors.accent,

                    fontSize: 12,

                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // =====================================
  // STATS
  // =====================================

  Widget _buildStats() {

    return Padding(

      padding:
      const EdgeInsets.symmetric(horizontal: 20),

      child: Row(

        children: [

          _statItem(

            '28',

            'Courses\nEnrolled',

            AppColors.accent,
          ),

          _divider(),

          _statItem(

            '142',

            'Hours\nLearned',

            AppColors.accentGold,
          ),

          _divider(),

          _statItem(

            '94%',

            'Average\nScore',

            AppColors.success,
          ),
        ],
      ),
    );
  }

  Widget _statItem(
      String value,
      String label,
      Color color,
      ) {

    return Expanded(

      child: Container(

        padding:
        const EdgeInsets.symmetric(
          vertical: 16,
        ),

        decoration: BoxDecoration(

          color: AppColors.surface,

          borderRadius:
          BorderRadius.circular(16),

          border:
          Border.all(color: AppColors.divider),
        ),

        child: Column(

          children: [

            Text(

              value,

              style: TextStyle(

                color: color,

                fontSize: 20,

                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 4),

            Text(

              label,

              textAlign: TextAlign.center,

              style: const TextStyle(

                color: AppColors.textSecondary,

                fontSize: 10,

                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _divider() =>
      const SizedBox(width: 10);

  // =====================================
  // SECTION
  // =====================================

  Widget _buildSection(

      BuildContext context,

      String title,

      List<_MenuItem> items,
      ) {

    return Padding(

      padding:
      const EdgeInsets.fromLTRB(
          20,
          24,
          20,
          0),

      child: Column(

        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          Text(

            title,

            style: const TextStyle(

              color: AppColors.textPrimary,

              fontSize: 16,

              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 12),

          Container(

            decoration: BoxDecoration(

              color: AppColors.surface,

              borderRadius:
              BorderRadius.circular(20),

              border:
              Border.all(color: AppColors.divider),
            ),

            child: Column(

              children:
              items.asMap().entries.map((e) {

                final item = e.value;

                final isLast =
                    e.key == items.length - 1;

                return Column(

                  children: [

                    _buildMenuItem(
                      context,
                      item,
                    ),

                    if (!isLast)

                      const Divider(

                        color: AppColors.divider,

                        height: 1,

                        indent: 60,
                      ),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  // =====================================
  // MENU ITEM
  // =====================================

  Widget _buildMenuItem(

      BuildContext context,

      _MenuItem item,
      ) {

    return InkWell(

      borderRadius:
      BorderRadius.circular(16),

      onTap: () {

        if (item.title ==
            'Watch History') {

          Navigator.push(

            context,

            MaterialPageRoute(

              builder: (_) =>
              const WatchHistoryScreen(),
            ),
          );
        }
      },

      child: Padding(

        padding:
        const EdgeInsets.symmetric(

          horizontal: 16,

          vertical: 14,
        ),

        child: Row(

          children: [

            Container(

              width: 38,

              height: 38,

              decoration: BoxDecoration(

                color:
                item.color.withOpacity(0.15),

                borderRadius:
                BorderRadius.circular(12),
              ),

              child: Icon(

                item.icon,

                color: item.color,

                size: 18,
              ),
            ),

            const SizedBox(width: 14),

            Expanded(

              child: Column(

                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  Text(

                    item.title,

                    style: const TextStyle(

                      color:
                      AppColors.textPrimary,

                      fontSize: 14,

                      fontWeight:
                      FontWeight.w600,
                    ),
                  ),

                  if (item.subtitle.isNotEmpty)

                    Text(

                      item.subtitle,

                      style: const TextStyle(

                        color:
                        AppColors.textSecondary,

                        fontSize: 11,
                      ),
                    ),
                ],
              ),
            ),

            const Icon(

              Icons.chevron_right_rounded,

              color:
              AppColors.textSecondary,

              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}

// =====================================
// MENU MODEL
// =====================================

class _MenuItem {

  final IconData icon;

  final String title;

  final String subtitle;

  final Color color;

  const _MenuItem(

      this.icon,

      this.title,

      this.subtitle,

      this.color,
      );
}
