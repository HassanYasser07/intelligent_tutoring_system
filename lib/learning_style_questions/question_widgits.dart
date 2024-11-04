import 'package:flutter/material.dart';
import 'package:intelligent_tutoring_system/learning_style_questions/question_card.dart';

class QuestionWidget extends StatelessWidget {

  const QuestionWidget({super.key, required List<String> questions});

  @override
  Widget build(BuildContext context) {
    return QuestionCard(questions: const [ 'السؤال الأول؟',
      'السؤال الثاني؟',
      'السؤال الثالث؟',
      'السؤال الرابع؟',
      'السؤال الخامس؟',],);
  }
}