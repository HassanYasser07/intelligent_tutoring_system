import 'package:flutter/material.dart';
import 'package:intelligent_tutoring_system/fetures/lessons/presentation/widgets/lesson_view_body.dart';
class LessonView extends StatelessWidget {
  const LessonView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: LessonViewBody(),
    );
  }
}
