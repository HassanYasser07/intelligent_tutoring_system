import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'learned_topics_card.dart';

class TopicsGrid extends StatelessWidget {
  final List<String> topics;

  const TopicsGrid({super.key, required this.topics});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: topics.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
        childAspectRatio: 3,
      ),
      itemBuilder: (context, index) {
        return TopicCard(topic: topics[index]);
      },
    );
  }
}
