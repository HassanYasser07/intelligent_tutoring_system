import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Learn, practice, and master\nprogramming. Together with\nyour Codingo team!',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 18.sp,
        height: 1.1,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
