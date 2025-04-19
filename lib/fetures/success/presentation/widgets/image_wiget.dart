import 'package:flutter/material.dart';
class ImageWiget extends StatelessWidget {

  const ImageWiget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: SizedBox(
        height: screenHeight * 0.35,
        width: double.infinity,
        child:  Image.asset(
          'assets/Add a heading 1.png',
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    );
  }
}
