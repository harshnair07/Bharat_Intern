import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizletts/data/question.dart';
import 'package:quizletts/question_summary.dart';
import 'package:quizletts/data/question.dart';

class Result extends StatelessWidget {
  const Result({
    Key? key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer':
            questions[i].answers[0], // Changed key to 'correct_answer'
        'user_answer': chosenAnswers[i], // Changed key to 'user_answer'
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summary_data = getSummaryData();
    final numTotalQuestions = questions.length;
    final numcorrectQuestions = summary_data.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(45),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numcorrectQuestions out of $numTotalQuestions correctly!',
              style: GoogleFonts.lato(
                color: Color.fromARGB(255, 251, 250, 250),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            //const Text('You answered X out of Y questions correctly!'),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summary_data),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Color.fromARGB(31, 2, 0, 0),
              ),
              icon: Icon(Icons.refresh),
              label: const Text('Restart Quiz!'),
            )
          ],
        ),
      ),
    );
  }
}
