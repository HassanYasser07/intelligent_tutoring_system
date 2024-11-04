import 'package:flutter/material.dart';
import 'package:intelligent_tutoring_system/fetures/learning_style_questions/active_and_reflective_questions/presentation/widgets/question_card.dart';


class QuestionWidget extends StatelessWidget {
  const QuestionWidget({super.key,  });

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: QuestionScreen(),
    );
  }
}