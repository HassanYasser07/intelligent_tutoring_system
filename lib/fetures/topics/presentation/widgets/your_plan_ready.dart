import 'package:flutter/material.dart';
class YourPlanReady extends StatelessWidget {
  final VoidCallback? onPressed;

  const YourPlanReady({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double buttonWidth = size.width * 0.17; // دائري ومتجاوب
    final double buttonHeight = size.width * 0.13; // دائري ومتجاوب


    return Stack(
      children: [
        // Confetti Layer (optional: static here)
        Positioned.fill(
          child: Image.asset(
            'assets/icons/WhatsApp Image 2025-04-22 at 00.38.50_18e7a008.jpg', // صورة القصاصات
            fit: BoxFit.cover,
          ),
        ),

        // Main content
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 2),

                Text(
                  'Your personalized plan\nis ready!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: size.width * 0.06,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16),

                Text(
                  'Based on your knowledge, we built\na journey to help you achieve your goal.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: size.width * 0.045,
                    color: Colors.black87,
                  ),
                ),

                const Spacer(flex: 3),

                // Button + Owl
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Transform.translate(
                      offset: Offset(size.width * 0.2, 0), // تحريك جهة اليمين بـ 5% من عرض الشاشة
                      child: Image.asset(
                        'assets/icons/duo.png',
                        width: size.width * 0.6,
                      ),
                    ),
                    Positioned(
                      top: 10,
                      child:GestureDetector(
                        onTap: onPressed,
                        child: Container(
                          width: buttonWidth,
                          height: buttonHeight,
                          decoration: BoxDecoration(
                            color: const Color(0xFF58CC02), // لون أخضر مشابه للزر في الصورة
                            borderRadius: BorderRadius.circular(16), // زوايا مستديرة ناعمة
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 6,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                        ),
                      ),

                    ),
                  ],
                ),

                const Spacer(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
