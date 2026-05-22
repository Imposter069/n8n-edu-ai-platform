import 'package:flutter/material.dart';

import 'quiz_screen.dart';

class QuizHomeScreen extends StatelessWidget {

  const QuizHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      const Color(0xFF081B33),

      appBar: AppBar(

        backgroundColor:
        const Color(0xFF081B33),

        title: const Text(
          "Math Quiz",
        ),
      ),

      body: Padding(

        padding:
        const EdgeInsets.all(20),

        child: Column(

          children: [

            buildQuizCard(

              context,

              "Class 1 Quiz",

              "Easy Addition Quiz",

              Colors.cyan,

              1,
            ),

            const SizedBox(height: 20),

            buildQuizCard(

              context,

              "Class 2 Quiz",

              "Addition & Subtraction",

              Colors.orange,

              2,
            ),

            const SizedBox(height: 20),

            buildQuizCard(

              context,

              "Class 3 Quiz",

              "Multiplication & Division",

              Colors.pink,

              3,
            ),
          ],
        ),
      ),
    );
  }

  // ===================================
  // QUIZ CARD
  // ===================================

  Widget buildQuizCard(

      BuildContext context,

      String title,

      String subtitle,

      Color color,

      int classLevel,
      ) {

    return GestureDetector(

      onTap: () {

        Navigator.push(

          context,

          MaterialPageRoute(

            builder: (_) =>
                QuizScreen(
                  classLevel: classLevel,
                ),
          ),
        );
      },

      child: Container(

        width: double.infinity,

        padding:
        const EdgeInsets.all(20),

        decoration: BoxDecoration(

          color:
          const Color(0xFF10284A),

          borderRadius:
          BorderRadius.circular(20),

          border: Border.all(
            color: Colors.white12,
          ),
        ),

        child: Row(

          children: [

            Container(

              width: 70,

              height: 70,

              decoration: BoxDecoration(

                color:
                color.withOpacity(0.2),

                borderRadius:
                BorderRadius.circular(
                  20,
                ),
              ),

              child: Icon(

                Icons.quiz,

                color: color,

                size: 40,
              ),
            ),

            const SizedBox(width: 20),

            Expanded(

              child: Column(

                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  Text(

                    title,

                    style: const TextStyle(

                      color: Colors.white,

                      fontSize: 22,

                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(

                    subtitle,

                    style: const TextStyle(

                      color:
                      Colors.white70,

                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),

            const Icon(

              Icons.arrow_forward_ios,

              color: Colors.white70,
            ),
          ],
        ),
      ),
    );
  }
}