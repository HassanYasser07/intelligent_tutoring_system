import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'fetures/learning_style_questions/active_and_reflective_questions/presentation/intelligent_tutoring_app.dart';






void main() async{
  await ScreenUtil.ensureScreenSize();
  runApp(const IntelligentTutoringApp());
}
