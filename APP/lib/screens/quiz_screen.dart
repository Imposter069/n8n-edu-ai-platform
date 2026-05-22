import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {

  final int classLevel;

  const QuizScreen({

    super.key,

    required this.classLevel,
  });

  @override
  State<QuizScreen> createState() =>
      _QuizScreenState();
}

class _QuizScreenState
    extends State<QuizScreen> {

  int currentQuestion = 0;

  int score = 0;

  late List<Map<String, dynamic>>
  questions;

  @override
  void initState() {

    super.initState();

    loadQuestions();
  }

  // ===================================
  // LOAD QUESTIONS
  // ===================================

  void loadQuestions() {

    if (widget.classLevel == 1) {

      questions = [

        {
          "question":
          "What is 1 + 1 ?",

          "options":
          ["1", "2", "3", "4"],

          "answer":
          "2",
        },

        {
          "question":
          "What is 2 + 3 ?",

          "options":
          ["4", "5", "6", "7"],

          "answer":
          "5",
        },

        {
          "question":
          "What is 5 - 2 ?",

          "options":
          ["2", "3", "4", "5"],

          "answer":
          "3",
        },

        {
          "question":
          "What is 3 + 4 ?",

          "options":
          ["5", "6", "7", "8"],

          "answer":
          "7",
        },

        {
          "question":
          "What is 9 - 5 ?",

          "options":
          ["2", "3", "4", "5"],

          "answer":
          "4",
        },

        {
          "question":
          "What is 6 + 1 ?",

          "options":
          ["5", "6", "7", "8"],

          "answer":
          "7",
        },
      ];

    } else if (widget.classLevel == 2) {

      questions = [

        {
          "question":
          "What is 10 - 4 ?",

          "options":
          ["5", "6", "7", "8"],

          "answer":
          "6",
        },

        {
          "question":
          "What is 8 + 7 ?",

          "options":
          ["13", "14", "15", "16"],

          "answer":
          "15",
        },

        {
          "question":
          "What is 20 - 9 ?",

          "options":
          ["10", "11", "12", "13"],

          "answer":
          "11",
        },

        {
          "question":
          "What is 12 + 5 ?",

          "options":
          ["15", "16", "17", "18"],

          "answer":
          "17",
        },

        {
          "question":
          "What is 25 - 10 ?",

          "options":
          ["13", "14", "15", "16"],

          "answer":
          "15",
        },

        {
          "question":
          "What is 9 + 9 ?",

          "options":
          ["16", "17", "18", "19"],

          "answer":
          "18",
        },
      ];

    } else {

      questions = [

        {
          "question":
          "What is 5 × 2 ?",

          "options":
          ["8", "10", "12", "15"],

          "answer":
          "10",
        },

        {
          "question":
          "What is 12 ÷ 3 ?",

          "options":
          ["2", "3", "4", "5"],

          "answer":
          "4",
        },

        {
          "question":
          "What is 7 × 3 ?",

          "options":
          ["18", "19", "20", "21"],

          "answer":
          "21",
        },

        {
          "question":
          "What is 20 ÷ 5 ?",

          "options":
          ["2", "3", "4", "5"],

          "answer":
          "4",
        },

        {
          "question":
          "What is 6 × 6 ?",

          "options":
          ["30", "32", "34", "36"],

          "answer":
          "36",
        },

        {
          "question":
          "What is 18 ÷ 2 ?",

          "options":
          ["7", "8", "9", "10"],

          "answer":
          "9",
        },
      ];
    }
  }

  // ===================================
  // CHECK ANSWER
  // ===================================

  void checkAnswer(String option) {

    if (option ==
        questions[currentQuestion]
        ['answer']) {

      score++;
    }

    if (currentQuestion <
        questions.length - 1) {

      setState(() {

        currentQuestion++;
      });

    } else {

      showResult();
    }
  }

  // ===================================
  // SHOW RESULT
  // ===================================

  void showResult() {

    showDialog(

      context: context,

      builder: (_) => AlertDialog(

        backgroundColor:
        const Color(0xFF10284A),

        title: const Text(

          "Quiz Completed",

          style: TextStyle(
            color: Colors.white,
          ),
        ),

        content: Text(

          "Your Score: $score / ${questions.length}",

          style: const TextStyle(
            color: Colors.white70,
          ),
        ),

        actions: [

          TextButton(

            onPressed: () {

              Navigator.pop(context);

              Navigator.pop(context);
            },

            child: const Text(
              "OK",
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final question =
    questions[currentQuestion];

    return Scaffold(

      backgroundColor:
      const Color(0xFF081B33),

      appBar: AppBar(

        backgroundColor:
        const Color(0xFF081B33),

        title: Text(
          "Class ${widget.classLevel} Quiz",
        ),
      ),

      body: Padding(

        padding:
        const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [

            Text(

              "Question ${currentQuestion + 1}/${questions.length}",

              style: const TextStyle(

                color: Colors.white70,

                fontSize: 18,
              ),
            ),

            const SizedBox(height: 30),

            Container(

              width: double.infinity,

              padding:
              const EdgeInsets.all(20),

              decoration: BoxDecoration(

                color:
                const Color(0xFF10284A),

                borderRadius:
                BorderRadius.circular(20),
              ),

              child: Text(

                question['question'],

                style: const TextStyle(

                  color: Colors.white,

                  fontSize: 24,

                  fontWeight:
                  FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 30),

            ...question['options']
                .map<Widget>(

                  (option) {

                return Padding(

                  padding:
                  const EdgeInsets.only(
                    bottom: 15,
                  ),

                  child: SizedBox(

                    width: double.infinity,

                    height: 60,

                    child: ElevatedButton(

                      style:
                      ElevatedButton.styleFrom(

                        backgroundColor:
                        const Color(
                          0xFF10284A,
                        ),

                        foregroundColor:
                        Colors.white,
                      ),

                      onPressed: () {

                        checkAnswer(
                          option,
                        );
                      },

                      child: Text(

                        option,

                        style:
                        const TextStyle(

                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ).toList(),
          ],
        ),
      ),
    );
  }
}