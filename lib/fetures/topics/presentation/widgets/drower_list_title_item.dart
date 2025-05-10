import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
class DrawerListTileItem extends StatelessWidget {
  const DrawerListTileItem({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
    this.trailing,
    this.onTap,
  });

  final String title;
  final String icon;
  final bool isSelected;
  final Widget? trailing;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        onTap: onTap,
        selected: isSelected,
        title: Text(
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.sp,
          ),
          title,
        ),
        leading: SvgPicture.asset(icon,
        ),
        trailing: trailing,
      ),
    );
  }
}
