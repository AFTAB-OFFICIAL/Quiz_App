import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Image.asset(
              'assets/images/quiz.png',
            ),
          ),
          const SizedBox(
            height: 50,
          ),
         const  Text(
            'Learn Flutter the Fun way',
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
         const  SizedBox(
            height: 40,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text(
              'Start Quiz',
            ),
          )
        ],
      ),
    );
  }
}
