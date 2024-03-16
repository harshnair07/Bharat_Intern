import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 350,
          color: const Color.fromARGB(150, 255, 255, 255),
        ),
        const SizedBox(height: 50),
        Text(
          'Welcome To The Ultimate Quizellet!!',
          style: GoogleFonts.abrilFatface(
              color: const Color.fromARGB(255, 206, 156, 156),
              fontWeight: FontWeight.bold,
              fontSize: 30),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 50,
        ),
        OutlinedButton.icon(
          onPressed: startQuiz,
          style: OutlinedButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 255, 255, 255)),
          icon: const Icon(Icons.arrow_right_alt_outlined),
          label: const Text('Lets Start!'),
        )
      ]),
    );
  }
}
