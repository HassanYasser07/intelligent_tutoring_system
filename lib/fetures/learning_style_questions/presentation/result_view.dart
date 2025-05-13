import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intelligent_tutoring_system/core/general_widgets/app_text_buttom.dart';

import '../../../core/routing/routing.dart';

class ResultView extends StatelessWidget {
  final Map<String, dynamic> results;

  const ResultView({
    super.key,
    required this.results,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Stack(

            children: [

              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: const Color(0xFF58CC02),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: const [
                                        Row(
                                          children: [
                                            Text(
                                              "You've unlocked your  brain's \n learning style!",
                                              maxLines: 2,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          "Here's what your brain loves most!",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _buildResultSection(
                            'Active',

                            results['activeReflectiveResult'].toString(),
                            'assets/icons/1.png',
                        "You like jumping into action and learning through experience."),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildResultSection(
                            'Reflective',
                            results['reflectiveResult'].toString(),
                            'assets/icons/2.png','You enjoy learning by watching, reading, or thinking things through.'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _buildResultSection(
                            'Visual',
                            results['visualVerbalResult'].toString(),
                            'assets/icons/3.png','You remember things you see more than things you hear.'),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildResultSection(
                            'Verbal',
                            results['verbalResult'].toString(),
                            'assets/icons/4.png','You love words, explanations, and storytelling.'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: _buildResultSection(
                            'Sensing',
                            results['sensingIntuitiveResult'].toString(),
                            'assets/icons/5.png','You like learning things that are practical and grounded.'),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildResultSection(
                            'Intuitive',
                            results['sensingResult'].toString(),
                            'assets/icons/6.png','You like patterns, innovation, and thinking outside the box.'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: _buildResultSection(
                            'Sequential',
                            results['sequentialGlobalResult'].toString(),
                            'assets/icons/7.png','You prefer clear order, instructions, and building knowledge gradually.'),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildResultSection(
                            'Global',
                            results['globalResult'].toString(),
                            'assets/icons/8.png','You often make connections and “get it” once you understand the whole idea.'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomButton(
                      variant: ButtonVariant.secondary,
                      label: 'Start Learning',
                      onPressed: () {
                        GoRouter.of(context).push(Routes.kShatBootView);
                      }),
                ],
              ),
              Positioned(
                right: 0,
                top: -5,
                child: Image.asset(
                  'assets/icons/tarek.png',
                  height: 150.h,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResultSection(String title, String result, String imgUrl,String description) {
    // Convert string to double, default to 0.0 if conversion fails
    final double resultValue = double.tryParse(result) ?? 0.0;

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(imgUrl),
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF58CC02),
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(description,style: TextStyle(
              color: Color(0xFF58CC02)
            ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 10,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: LinearProgressIndicator(
                        value: resultValue,
                        backgroundColor: const Color(0xFF58CC02),
                        valueColor: const AlwaysStoppedAnimation<Color>(
                            Color(0xFFFFC800)),
                        minHeight: 13,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 1),
                Expanded(
                  flex: 4,
                  child: Text(
                    result,
                    style:
                        const TextStyle(fontSize: 16, color: Color(0xFFD3B200)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
