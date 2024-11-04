import 'package:flutter/material.dart';
class QuestionCard extends StatefulWidget {
  final List<String> questions;

  const QuestionCard({super.key, required this.questions});

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  int activeTotal = 0;
  int reflectiveTotal = 0;
  int currentQuestionIndex = 0;

  void updateScores(int active, int reflective) {
    setState(() {
      activeTotal += active;
      reflectiveTotal += reflective;
      if (currentQuestionIndex < widget.questions.length - 1) {
        currentQuestionIndex++;
      }
      else {
        // هنا يمكنك عرض النتيجة النهائية
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("النتيجة النهائية"),
            content: Text("Active: $activeTotal, Reflective: $reflectiveTotal"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("إغلاق"),
              ),
            ],
          ),
        );
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              widget.questions[currentQuestionIndex],
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () => updateScores(100, 0),
                icon: Icon(Icons.circle),
              ),
              IconButton(
                onPressed: () => updateScores(75, 25),
                icon: Icon(Icons.circle),
              ),
              IconButton(
                onPressed: () => updateScores(50, 50),
                icon: Icon(Icons.circle),
              ),
              IconButton(
                onPressed: () => updateScores(25, 75),
                icon: Icon(Icons.circle),
              ),
              IconButton(
                onPressed: () => updateScores(0, 100),
                icon: Icon(Icons.circle),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Active Total: $activeTotal'),
                Text('Reflective Total: $reflectiveTotal'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
