import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'learning_style_questions/intelligent_tutoring_app.dart';






void main() async{
  await ScreenUtil.ensureScreenSize();
  runApp(const IntelligentTutoringApp());
}
