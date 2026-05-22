import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

import 'subject_learning_screen.dart';

import 'supabase_service.dart';

class SubjectScreen extends StatefulWidget {

  final String className;

  final int classId;

  const SubjectScreen({

    super.key,

    required this.className,

    required this.classId,
  });

  @override
  State<SubjectScreen> createState() =>
      _SubjectScreenState();
}

class _SubjectScreenState
    extends State<SubjectScreen> {

  final service = SupabaseService();

  List<dynamic> subjects = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    loadSubjects();
  }

  Future<void> loadSubjects() async {

    final data =
    await service.fetchSubjects(
      widget.classId,
    );

    setState(() {

      subjects = data;

      isLoading = false;
    });
  }

  IconData getSubjectIcon(
      String subject) {

    switch (subject.toLowerCase()) {

      case "mathematics":
        return Icons.calculate;

      case "physics":
        return Icons.science;

      case "chemistry":
        return Icons.biotech;

      case "biology":
        return Icons.eco;

      case "english":
        return Icons.menu_book;

      default:
        return Icons.school;
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      AppColors.primary,

      appBar: AppBar(

        backgroundColor:
        AppColors.primary,

        elevation: 0,

        title: Text(

          widget.className,

          style: const TextStyle(

            color:
            AppColors.textPrimary,

            fontWeight:
            FontWeight.bold,
          ),
        ),
      ),

      body: isLoading

          ? const Center(
        child:
        CircularProgressIndicator(),
      )

          : GridView.builder(

        padding:
        const EdgeInsets.all(20),

        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(

          crossAxisCount: 2,

          crossAxisSpacing: 16,

          mainAxisSpacing: 16,

          childAspectRatio: 1,
        ),

        itemCount:
        subjects.length,

        itemBuilder:
            (context, index) {

          final subject =
          subjects[index];

          return GestureDetector(

            onTap: () {

              Navigator.push(

                context,

                MaterialPageRoute(

                  builder: (_) =>
                      SubjectLearningScreen(

                        subjectName:
                        subject[
                        'subject_name'],

                        subjectId:
                        subject['id'],
                      ),
                ),
              );
            },

            child: Container(

              decoration:
              BoxDecoration(

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

              child: Column(

                mainAxisAlignment:
                MainAxisAlignment
                    .center,

                children: [

                  Icon(

                    getSubjectIcon(
                      subject[
                      'subject_name'],
                    ),

                    size: 50,

                    color:
                    AppColors.accent,
                  ),

                  const SizedBox(
                      height: 16),

                  Text(

                    subject[
                    'subject_name'],

                    textAlign:
                    TextAlign.center,

                    style:
                    const TextStyle(

                      color: AppColors
                          .textPrimary,

                      fontSize: 16,

                      fontWeight:
                      FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
