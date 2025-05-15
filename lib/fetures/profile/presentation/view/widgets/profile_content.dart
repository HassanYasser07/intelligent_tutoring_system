import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intelligent_tutoring_system/fetures/profile/presentation/view/widgets/profile_card.dart';
import 'package:intelligent_tutoring_system/fetures/profile/presentation/view/widgets/user_info_card.dart';

import '../../../../../core/general_widgets/custom_appBar.dart';
import '../../../data/models/profile_model.dart';
import 'knowledge_base.dart';
class ProfileContent extends StatefulWidget {
  final ProfileModel profile;
  final GlobalKey<ScaffoldState> scaffoldKey;


  const ProfileContent({super.key, required this.profile, required this.scaffoldKey});

  @override
  State<ProfileContent> createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomAppBar(
            title: 'Profile',
            showBackButton: false,
            toggleDrawer: () => widget.scaffoldKey.currentState?.openDrawer(),
          ),
          UserInfoCard(name:widget.profile.name! , email:widget.profile.email! ),
          SizedBox(height: 16.h),
          ProfileCard(profile: widget.profile),
          SizedBox(height: 16.h),
          const KnowledgeBaseWidget(),
          SizedBox(height: 16.h),

        ],
      ),
    );
  }
}
