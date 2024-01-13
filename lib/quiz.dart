import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/question_screen.dart';
import 'package:adv_basics/results_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
//"----------------FIRST APPROACH---------------------------";
  // String activeScreen = 'startScreen';

  // void switchScreens() {
  //   setState(() {
  //     activeScreen = 'questionScreen';
  //   });
  // }
//'--------------------------------------------------------------'
  String activeScreen = 'startScreen';
  List<String> selectedAnswer = [];

  void switchScreens() {
    setState(() {
      activeScreen = 'questionScreen';
    });
  }

  choosedAnswer(String answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questions.length) {
      setState(() {
        selectedAnswer = [];
        activeScreen = 'resultsScreen';
      });
    }
  }

  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreens);

    if (activeScreen == 'questionScreen') {
      screenWidget = QuestionScreen(
        onSelectAnswer: choosedAnswer,
      );
    }

    if (activeScreen == 'resultsScreen') {
      screenWidget = ResultsScreen(chosenAnswer: selectedAnswer);
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.purpleAccent,
                  Colors.purple,
                ],
              ),
            ),
            child: screenWidget

            //'---------------FIRST APPROACH-------------------------'
            // activeScreen == 'startScreen'
            //     ? StartScreen(switchScreens)
            //     : const QuestionScreen(),
            ),
      ),
    );
  }
}
