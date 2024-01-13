import 'package:adv_basics/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
   QuestionScreen({super.key, required this.onSelectAnswer});

  final void Function(String aswer) onSelectAnswer; 
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentAnswerIndex = 0;

  void answerQuestions(String selectedAnswer) {
    // currentAnswerIndex = currentAnswerIndex + 1; // first way of doing
    // currentAnswerIndex += 1; // second way of doing
    widget.onSelectAnswer(selectedAnswer);
    currentAnswerIndex++; // third and effective way
    setState(() {});
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentAnswerIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),

            ...currentQuestion.getShuffledList().map(
              (answers) {
                return AnswerButton(
                  answerText: answers,
                  ontap: (){
                    answerQuestions(answers);
                  }
                );
              },
            ),
            // AnswerButton(answerText: 'Answer 1', ontap: () {}),
            // AnswerButton(answerText: 'Answer 2', ontap: () {}),
            // AnswerButton(answerText: 'Answer 3', ontap: () {}),
          ],
        ),
      ),
    );
  }
}
