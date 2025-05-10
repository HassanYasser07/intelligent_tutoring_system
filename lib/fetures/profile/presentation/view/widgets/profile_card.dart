import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/general_widgets/app_text_buttom.dart';
import '../../../../../core/routing.dart';
import '../../../data/models/profile_model.dart';
import 'learning_style_section.dart';
class ProfileCard extends StatelessWidget {

  final ProfileModel profile;
  void _clearCachedUserKnowledge() async {
    final prefs = await SharedPreferences.getInstance();
    final success = await prefs.remove('cached_learning_objects');
    if (success) {
      print('✅ Cached user knowledge data deleted.');
    } else {
      print('⚠️ No data to delete.');
    }
  }
  const ProfileCard({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE2FFCC),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        children: [
          const Text(
            'Your Learning Style',
            style: TextStyle(
              color: Color(0xFF54BA07),
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
          ),
          LearningStyleSection(profile: profile),
          const SizedBox(height: 10),
          CustomButton(
            size: ButtonSize.large,
            label: 'Restyle',
            variant: ButtonVariant.super_,
            onPressed: () async {
              _clearCachedUserKnowledge();

              await GoRouter.of(context).pushReplacement(Routes.kLearningStyleQuestionsView);
            },
          ),
        ],
      ),
    );
  }
}
