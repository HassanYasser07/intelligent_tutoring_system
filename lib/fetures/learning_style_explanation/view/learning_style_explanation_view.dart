import 'package:flutter/material.dart';
import 'package:intelligent_tutoring_system/fetures/learning_style_explanation/view/widgets/learning_style_explanation_card.dart';

class LearningStyleExplanationView extends StatelessWidget {
  const LearningStyleExplanationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD6F9BC),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: const [
          Text(
            'Learning Style Types',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          LearningStyleExplanationCard(
            title: 'Active',
            iconPath: 'assets/icons/1.png',
            description: 'You like jumping into action and learning through experience.',
          ),
          LearningStyleExplanationCard(
            title: 'Reflective',
            iconPath: 'assets/icons/2.png',
            description: 'You enjoy learning by watching, reading, or thinking things through.',
          ),
          LearningStyleExplanationCard(
            title: 'Visual',
            iconPath: 'assets/icons/3.png',
            description: 'You remember things you see more than things you hear.',
          ),
          LearningStyleExplanationCard(
            title: 'Verbal',
            iconPath: 'assets/icons/4.png',
            description: 'You love words, explanations, and storytelling.',
          ),
          LearningStyleExplanationCard(
            title: 'Sensing',
            iconPath: 'assets/icons/5.png',
            description: 'You like learning things that are practical and grounded.',
          ),
          LearningStyleExplanationCard(
            title: 'Intuitive',
            iconPath: 'assets/icons/6.png',
            description: 'You like patterns, innovation, and thinking outside the box.',
          ),
          LearningStyleExplanationCard(
            title: 'Sequential',
            iconPath: 'assets/icons/7.png',
            description: 'You prefer clear order, instructions, and building knowledge gradually.',
          ),
          LearningStyleExplanationCard(
            title: 'Global',
            iconPath: 'assets/icons/8.png',
            description: 'You often make connections and “get it” once you understand the whole idea.',
          ),
        ],
      ),
    );
  }
}
