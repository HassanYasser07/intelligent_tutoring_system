import 'package:flutter/material.dart';
import 'package:intelligent_tutoring_system/fetures/profile/presentation/view/widgets/profile_card.dart';

import '../../../../../core/general_widgets/custom_appBar.dart';
import '../../../data/models/profile_model.dart';
class ProfileContent extends StatefulWidget {
  final ProfileModel profile;
  final GlobalKey<ScaffoldState> scaffoldKey; // أضف هذا


  const ProfileContent({super.key, required this.profile, required this.scaffoldKey});

  @override
  State<ProfileContent> createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          CustomAppBar(
            title: 'Learning Path',
            showBackButton: false,
            toggleDrawer: () => widget.scaffoldKey.currentState?.openDrawer(),
          ),
          ProfileCard(profile: widget.profile),
        ],
      ),
    );
  }
}
