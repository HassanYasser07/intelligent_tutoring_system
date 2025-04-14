
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/theme/colors.dart';
import '../../../../../../core/theme/style.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasNumber;
  final bool hasMinLength;
  final bool hasSpecialCharacters;

  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasNumber,
    required this.hasMinLength,
    required this.hasSpecialCharacters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At least 1 lowercase letter', hasLowerCase),
        SizedBox(
          height: 2.h,
        ),
        buildValidationRow('At least 1 uppercase letter', hasUpperCase),
        SizedBox(
          height: 2.h,
        ),
        buildValidationRow('At least 1 number ', hasNumber),
        SizedBox(
          height: 2.h,
        ),
        buildValidationRow('At least 8 characters long', hasMinLength),
        SizedBox(
          height: 2.h,
        ),
        buildValidationRow('At least 1 special character', hasSpecialCharacters),
      ],
    );
  }
}

buildValidationRow(String text, bool hasValidated) {
  return Row(
    children: [
      const CircleAvatar(
        radius: 2.5,
      ),
      SizedBox(
        width: 6.h,
      ),
      Text(
        text,
        style: Styles.font13DarkBlueRegular.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            color: hasValidated ? Colors.grey : ColorsMaster.darkBlue),
      )
    ],
  );
}
