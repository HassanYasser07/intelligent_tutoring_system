//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:intelligent_tutoring_system/core/theme/colors.dart';
//
//
// class AppTextButtonn extends StatelessWidget {
//   final double? borderRadius;
//   final Color? backgroundColor;
//   final double? horizontalPadding;
//   final double? verticalPadding;
//   final double? buttonWidth;
//   final double? buttonHeight;
//   final String buttonText;
//   final TextStyle? textStyle;
//   final VoidCallback onPressed;
//   const AppTextButtonn({
//     super.key,
//     this.borderRadius,
//     this.backgroundColor,
//     this.horizontalPadding,
//     this.verticalPadding,
//     this.buttonHeight,
//     this.buttonWidth,
//     required this.buttonText,
//     this.textStyle,
//     required this.onPressed,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return    ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.green,
//                     padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     elevation: 2, // Add shadow effect
//                     shadowColor: Colors.green.withOpacity(0.9), // Shadow color
//                   ),
//                   onPressed: onPressed,
//                   child:  Text(
//                    buttonText,
//                     style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                 );
//   }
// }
//
//
//
//
// class AppTextButton extends StatelessWidget {
//   final double? borderRadius;
//   final Color? backgroundColor;
//   final double? horizontalPadding;
//   final double? verticalPadding;
//   final double? buttonWidth;
//   final double? buttonHeight;
//   final String buttonText;
//   final TextStyle textStyle;
//   final VoidCallback onPressed;
//   const AppTextButton({
//     super.key,
//     this.borderRadius,
//     this.backgroundColor,
//     this.horizontalPadding,
//     this.verticalPadding,
//     this.buttonHeight,
//     this.buttonWidth,
//     required this.buttonText,
//     required this.textStyle,
//     required this.onPressed,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       style: ButtonStyle(
//         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//           RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(borderRadius ?? 16.0),
//           ),
//         ),
//         backgroundColor: MaterialStatePropertyAll(
//           backgroundColor ?? ColorsMaster.mainBlue,
//         ),
//         padding: MaterialStateProperty.all<EdgeInsets>(
//           EdgeInsets.symmetric(
//             horizontal: horizontalPadding?.w ?? 12.w,
//             vertical: verticalPadding?.h ?? 14.h,
//           ),
//         ),
//         fixedSize: MaterialStateProperty.all(
//           Size(buttonWidth?.w ?? double.maxFinite, buttonHeight ?? 50.h),
//         ),
//       ),
//       onPressed: onPressed,
//       child: Text(
//         buttonText,
//         style: textStyle,
//       ),
//     );
//   }
// }
//
//

import 'package:flutter/material.dart';
enum ButtonVariant {
  locked,
  primary,
  secondary,
  secondaryOutline,
  primaryOutline,
  danger,
  dangerOutline,
  super_,
  superOutline,
  ghost,
  sidebar,
  sidebarOutline,
  none,
  default_,
}

enum ButtonSize {
  sm,
  default_,
  lg,
  icon,
  rounded,
}

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final ButtonVariant variant;
  final ButtonSize size;
  final IconData? icon;
  final bool disabled;

  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.variant = ButtonVariant.default_,
    this.size = ButtonSize.default_,
    this.icon,
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = _getBackgroundColor(variant);
    final Color foregroundColor = _getForegroundColor(variant);
    final EdgeInsetsGeometry padding = _getPadding(size);
    final OutlinedBorder shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(_getBorderRadius(size)),
      side: _getBorderSide(variant),
    );

    return ElevatedButton(
      onPressed:  disabled ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        padding: padding,
        shape: shape,
        elevation: _getElevation(variant),
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
      ),
      child: icon != null
          ? Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18),
          const SizedBox(width: 8),
          Text(label.toUpperCase()),
        ],
      )
          : Text(label.toUpperCase()),
    );
  }

  double _getBorderRadius(ButtonSize size) {
    switch (size) {
      case ButtonSize.rounded:
        return 100;
      default:
        return 12;
    }
  }

  EdgeInsetsGeometry _getPadding(ButtonSize size) {
    switch (size) {
      case ButtonSize.sm:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 8);
      case ButtonSize.lg:
        return const EdgeInsets.symmetric(horizontal: 24, vertical: 16);
      case ButtonSize.icon:
        return const EdgeInsets.all(12);
      default:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 12);
    }
  }

  Color _getBackgroundColor(ButtonVariant variant) {
    switch (variant) {
      case ButtonVariant.primary:
        return Colors.green.shade300;
      case ButtonVariant.secondary:
        return Colors.green;
      case ButtonVariant.danger:
        return Colors.red;
      case ButtonVariant.super_:
        return Colors.indigo;
      case ButtonVariant.locked:
        return Colors.grey.shade300;
      case ButtonVariant.ghost:
      case ButtonVariant.none:
        return Colors.transparent;
      case ButtonVariant.primaryOutline:
      case ButtonVariant.secondaryOutline:
      case ButtonVariant.dangerOutline:
      case ButtonVariant.superOutline:
        return Colors.white;
      default:
        return Colors.white;
    }
  }

  Color _getForegroundColor(ButtonVariant variant) {
    switch (variant) {
      case ButtonVariant.primary:
      case ButtonVariant.secondary:
      case ButtonVariant.danger:
      case ButtonVariant.super_:
        return Colors.white;
      case ButtonVariant.locked:
        return Colors.black87;
      case ButtonVariant.primaryOutline:
        return Colors.green;
      case ButtonVariant.secondaryOutline:
        return Colors.green;
      case ButtonVariant.dangerOutline:
        return Colors.red;
      case ButtonVariant.superOutline:
        return Colors.indigo;
      default:
        return Colors.black;
    }
  }

  BorderSide _getBorderSide(ButtonVariant variant) {
    switch (variant) {
      case ButtonVariant.primaryOutline:
        return const BorderSide(color: Colors.lightBlue, width: 2);
      case ButtonVariant.secondaryOutline:
        return const BorderSide(color: Colors.green, width: 2);
      case ButtonVariant.dangerOutline:
        return const BorderSide(color: Colors.red, width: 2);
      case ButtonVariant.superOutline:
        return const BorderSide(color: Colors.indigo, width: 2);
      case ButtonVariant.locked:
        return const BorderSide(color: Colors.grey, width: 2);
      default:
        return BorderSide.none;
    }
  }

  double _getElevation(ButtonVariant variant) {
    switch (variant) {
      case ButtonVariant.locked:
      case ButtonVariant.ghost:
      case ButtonVariant.none:
      case ButtonVariant.sidebar:
      case ButtonVariant.sidebarOutline:
        return 0;
      default:
        return 2;
    }
  }
}
