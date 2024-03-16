import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizletts/question_idetifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {Key? key})
      : super(key: key); // Correct syntax

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
          isCorrectAnswer: isCorrectAnswer,
          questionIndex:
              itemData['question_index'] as int, // Use null-aware cast
        ),
        const SizedBox(width: 25),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemData['question'] as String,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                itemData['user_answer'] as String? ??
                    'No answer provided', // Handle null
                style:
                    const TextStyle(color: Color.fromARGB(255, 202, 171, 252)),
              ),
              Text(
                itemData['correct_answer'] as String? ??
                    'Correct answer missing', // Handle null
                style: const TextStyle(
                  color: Color.fromARGB(255, 181, 254, 246),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
