import 'package:flutter/material.dart';
import 'package:intelligent_tutoring_system/learning_style_questions/question_widgits.dart';

class IntelligentTutoringApp extends StatelessWidget {
  const IntelligentTutoringApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  Scaffold(
        body:  QuestionWidget(
          questions: [
            'السؤال الأول؟',
            'السؤال الثاني؟',
            'السؤال الثالث؟',
            'السؤال الرابع؟',
            'السؤال الخامس؟',
          ],
        ),
      ) ,
    );


  }
}
