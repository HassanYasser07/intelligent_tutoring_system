import 'package:flutter/material.dart';
class LearningStyleBar extends StatelessWidget {
  final String title;
  final double value;
  final String icon;

  const LearningStyleBar({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Image.asset(icon, width: 24, height: 24),
                const SizedBox(width: 6),
                Flexible(
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFF58CC02),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            flex: 5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: value,
                backgroundColor: const Color(0xFF58CC02),
                valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFFFC800)),
                minHeight: 13,
              ),
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            flex: 1,
            child: Text(
              value.toStringAsFixed(2),
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFFD3B200),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
