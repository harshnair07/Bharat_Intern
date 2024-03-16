import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier({
    Key? key, // Specify the key parameter correctly
    required this.isCorrectAnswer,
    required this.questionIndex,
  }) : super(key: key); // Use the correct constructor syntax

  final int questionIndex;
  final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {
    final questionNumber = questionIndex + 1;
    return Container(
      width: 35,
      height: 35,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrectAnswer
            ? const Color.fromARGB(197, 16, 80, 62)
            : const Color.fromARGB(197, 174, 88, 18),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        questionNumber.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    );
  }
}
