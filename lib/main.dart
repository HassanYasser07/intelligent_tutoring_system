import 'package:flutter/material.dart';
import 'package:intelligent_tutoring_system/question_widgits.dart';



void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Learning Style Quiz')),
      body: QuestionWidget(
        questions: [
          'السؤال الأول؟',
          'السؤال الثاني؟',
          'السؤال الثالث؟',
          'السؤال الرابع؟',
          'السؤال الخامس؟',
        ],
      ),
    ),
  ));
}
