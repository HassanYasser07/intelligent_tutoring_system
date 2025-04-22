import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/colors.dart';
import '../theme/style.dart';

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
        buildValidationRow('At least 1 lowercase letter', hasLowerCase,Colors.orange),
        SizedBox(
          height: 2.h,
        ),
        buildValidationRow('At least 1 uppercase letter', hasUpperCase,Colors.red),
        SizedBox(
          height: 2.h,
        ),
        buildValidationRow('At least 1 number ', hasNumber,Colors.lightBlue),
        SizedBox(
          height: 2.h,
        ),
        buildValidationRow('At least 8 characters long', hasMinLength,Colors.green),
        SizedBox(
          height: 2.h,
        ),
        buildValidationRow('At least 1 special character', hasSpecialCharacters,Colors.purple),
      ],
    );
  }
}

buildValidationRow(String text, bool hasValidated,Color color) {
  return Row(
    children: [
     Icon(Icons.star_rounded, color: color, size: 25.sp,),
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
