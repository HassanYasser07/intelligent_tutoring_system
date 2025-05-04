import 'package:flutter/material.dart';

import '../../../data/models/profile_model.dart';
import 'learning_style_bar.dart';
class LearningStyleSection extends StatelessWidget {
  final ProfileModel profile;

  const LearningStyleSection({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFd6f9bc),
      child: Column(
        children: [
          LearningStyleBar(title: 'Active', value: profile.learningStyleActiveReflective!, icon: 'assets/icons/1.png'),
          LearningStyleBar(title: 'Reflective', value: 1 - profile.learningStyleActiveReflective!, icon: 'assets/icons/2.png'),
          LearningStyleBar(title: 'Sensing', value: profile.learningStyleSensingIntuitive!, icon: 'assets/icons/3.png'),
          LearningStyleBar(title: 'Intuitive', value: 1 - profile.learningStyleSensingIntuitive!, icon: 'assets/icons/4.png'),
          LearningStyleBar(title: 'Sequential', value: profile.learningStyleSequentialGlobal!, icon: 'assets/icons/5.png'),
          LearningStyleBar(title: 'Global', value: 1 - profile.learningStyleSequentialGlobal!, icon: 'assets/icons/6.png'),
          LearningStyleBar(title: 'Visual', value: profile.learningStyleVisualVerbal!, icon: 'assets/icons/7.png'),
          LearningStyleBar(title: 'Verbal', value: 1 - profile.learningStyleVisualVerbal!, icon: 'assets/icons/8.png'),
        ],
      ),
    );
  }
}
