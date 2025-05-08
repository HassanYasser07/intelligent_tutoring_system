
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormHeader extends StatelessWidget {
  const FormHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Signup',
      style: TextStyle(
        fontSize: 48.sp,
        fontWeight: FontWeight.w900,
        color: const Color(0xFF58CC02),
      ),
    );
  }
}
