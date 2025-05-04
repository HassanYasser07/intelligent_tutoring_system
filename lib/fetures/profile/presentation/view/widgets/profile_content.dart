import 'package:flutter/material.dart';
import 'package:intelligent_tutoring_system/fetures/profile/presentation/view/widgets/profile_card.dart';

import '../../../data/models/profile_model.dart';
class ProfileContent extends StatelessWidget {
  final ProfileModel profile;

  const ProfileContent({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          ProfileCard(profile: profile),
        ],
      ),
    );
  }
}
