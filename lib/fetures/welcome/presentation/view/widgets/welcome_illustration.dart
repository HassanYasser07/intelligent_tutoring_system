import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeIllustration extends StatelessWidget {
  const WelcomeIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/Component 1.png',
      height: 200.h,
      fit: BoxFit.contain,
    );
  }
}
