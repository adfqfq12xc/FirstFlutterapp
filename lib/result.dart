import 'package:flutter/material.dart';
import 'package:flutter_application_2/data/questions.dart';

class Result extends StatelessWidget {
  Result({super.key, required this.selectedanswerr, required this.switchscreen});
  final List<String> selectedanswerr;
  final void Function() switchscreen;
  
  int get correctAnswersCount {
    int count = 0;
    for (var i = 0; i < selectedanswerr.length; i++) {
      if (selectedanswerr[i] == questions[i].answers[0]) {
        count++;
      }
    }
    return count;
  }

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < selectedanswerr.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedanswerr[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summary = getSummary();
    final correctAnswers = correctAnswersCount;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You answered $correctAnswers out of ${questions.length} questions correctly',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          ...summary.map((e) => Column(
                children: [
                  SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        child: Text(((e['question_index'] as int) + 1).toString()),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e['question'].toString(),
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Correct: ${e['correct_answer']}',
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                            Text(
                              'Your answer: ${e['user_answer']}',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.restart_alt),
            onPressed: switchscreen,
            label: const Text('Restart Quiz'),
          )
        ],
      ),
    );
  }
}
