import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intelligent_tutoring_system/core/theme/style.dart';


class AlreadyHaveAccountText extends StatelessWidget {
  final String text;
  final String account;
  final VoidCallback onActionPressed;
  
  const AlreadyHaveAccountText({
    super.key,
    required this.text,
    required this.onActionPressed, required this.account,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: '$account',
            style: Styles.font13DarkBlueRegular,
          ),
          TextSpan(
            text: ' $text',
            style: Styles.font13BlueSemiBold,
            recognizer: TapGestureRecognizer()
              ..onTap = onActionPressed,
          ),
        ],
      ),
    );
  }
}