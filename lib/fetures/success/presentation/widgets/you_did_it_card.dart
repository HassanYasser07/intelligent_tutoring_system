import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/general_widgets/app_text_buttom.dart';
import '../../../../core/routing.dart';

class YouDidItCard extends StatelessWidget {
  const YouDidItCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.85,
      padding: EdgeInsets.all(screenWidth * 0.05),
      margin: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 2,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Column(
        children: [
          const Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '🎉 ',
                    style: TextStyle(fontSize: 26),
                  ),
                  Text(
                    'You did it!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Text(
                "Now let’s get to know you better!\nWe’ll ask a few quick questions to\npersonalize your learning journey.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  height: 1.4,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.05),
          FractionallySizedBox(
            widthFactor: 0.99,
            child: CustomButton(
              label: "Start Quiz",
              variant: ButtonVariant.secondary,
              size: ButtonSize.lg,
              onPressed: () {
                GoRouter.of(context).push(Routes.kLearningStyleQuestionsView);
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
