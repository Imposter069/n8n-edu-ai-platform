import 'package:flutter/material.dart';
import 'subject_screen.dart';
import '../theme/app_theme.dart';


class SchoolSection extends StatelessWidget {

  const SchoolSection({super.key});

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

                itemCount: 12,

                itemBuilder: (_, index) {

                  final cls = index + 1;

                  final isJunior = cls <= 5;

                  final isMiddle =
                      cls <= 8 && cls > 5;

                  final color = isJunior

                      ? const Color(0xFF4ECDC4)

                      : isMiddle

                      ? const Color(0xFF00D4FF)

                      : const Color(0xFFFFB347);

                  final label = isJunior

                      ? 'Junior'

                      : isMiddle

                      ? 'Middle'

                      : 'Senior';

                  return GestureDetector(

                    onTap: () {

                      Navigator.push(

                        context,

                        MaterialPageRoute(

                          builder: (_) =>
                              SubjectScreen(

                                className:
                                'Class $cls',

                                classId: cls,
                              ),
                        ),
                      );
                    },

                    child: Container(

                      margin:
                      const EdgeInsets.only(
                        bottom: 12,
                      ),

                      padding:
                      const EdgeInsets.all(
                        18,
                      ),

                      decoration: BoxDecoration(

                        color:
                        AppColors.surface,

                        borderRadius:
                        BorderRadius.circular(
                          18,
                        ),

                        border: Border.all(
                          color:
                          AppColors.divider,
                        ),
                      ),

                      child: Row(

                        children: [

                          Container(

                            width: 50,

                            height: 50,

                            decoration:
                            BoxDecoration(

                              color: color
                                  .withOpacity(
                                  0.15),

                              borderRadius:
                              BorderRadius.circular(
                                14,
                              ),
                            ),

                            child: Center(

                              child: Text(

                                '$cls',

                                style:
                                TextStyle(

                                  color:
                                  color,

                                  fontSize:
                                  20,

                                  fontWeight:
                                  FontWeight.w800,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(
                            width: 16,
                          ),

                          Expanded(

                            child: Column(

                              crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,

                              children: [

                                Text(

                                  'Class $cls',

                                  style:
                                  const TextStyle(

                                    color:
                                    AppColors.textPrimary,

                                    fontSize:
                                    15,

                                    fontWeight:
                                    FontWeight.w700,
                                  ),
                                ),

                                const SizedBox(
                                  height: 3,
                                ),

                                Row(

                                  children: [

                                    Container(

                                      padding:
                                      const EdgeInsets.symmetric(

                                        horizontal:
                                        8,

                                        vertical:
                                        2,
                                      ),

                                      decoration:
                                      BoxDecoration(

                                        color: color
                                            .withOpacity(
                                            0.15),

                                        borderRadius:
                                        BorderRadius.circular(
                                          6,
                                        ),
                                      ),

                                      child: Text(

                                        label,

                                        style:
                                        TextStyle(

                                          color:
                                          color,

                                          fontSize:
                                          10,

                                          fontWeight:
                                          FontWeight.w600,
                                        ),
                                      ),
                                    ),

                                    const SizedBox(
                                      width: 8,
                                    ),

                                    const Text(

                                      'All subjects included',

                                      style:
                                      TextStyle(

                                        color:
                                        AppColors.textSecondary,

                                        fontSize:
                                        11,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          const Icon(

                            Icons
                                .arrow_forward_ios_rounded,

                            color:
                            AppColors.textSecondary,

                            size: 14,
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

  Widget _buildHeader(
      BuildContext context) {

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

                Icons
                    .arrow_back_ios_new_rounded,

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

                'School Education',

                style: TextStyle(

                  color:
                  AppColors.textPrimary,

                  fontSize: 20,

                  fontWeight:
                  FontWeight.w800,
                ),
              ),

              Text(

                'Select your class',

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
