import 'package:flutter/material.dart';
import 'package:intelligent_tutoring_system/fetures/success/presentation/widgets/image_wiget.dart';
import 'package:intelligent_tutoring_system/fetures/success/presentation/widgets/you_did_it_card.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const ImageWiget(),
            SizedBox(height: screenHeight * 0.05),
            const YouDidItCard(),
          ],
        ),
      ),
    );
  }
}



