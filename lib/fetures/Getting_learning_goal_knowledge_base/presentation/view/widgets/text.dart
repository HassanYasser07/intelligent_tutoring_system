import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class TextWidget extends StatelessWidget {
  final String question;
  const TextWidget({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return  Text(
     question,
      style: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }
}
