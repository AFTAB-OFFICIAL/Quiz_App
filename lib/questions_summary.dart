import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;

  QuestionsSummary(this.summaryData, {super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SingleChildScrollView(
        child: Column(
            children: summaryData.map((data) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                child: Text(
                  ((data['question_index'] as int) + 1).toString(),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      data['questions'] as String,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      data['user_answer'] as String,
                      style: const TextStyle(color: Colors.amber),
                    ),
                    Text(
                      data['correct_answer'] as String,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 33, 140, 226),
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              )
            ],
          );
        }).toList()),
      ),
    );
  }
}
