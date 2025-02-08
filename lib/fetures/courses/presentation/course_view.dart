import 'package:flutter/material.dart';
import 'package:intelligent_tutoring_system/fetures/courses/presentation/widgets/course_view_body.dart';
class CourseView extends StatelessWidget {
  const CourseView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CourseViewBody(),
    );
  }
}
