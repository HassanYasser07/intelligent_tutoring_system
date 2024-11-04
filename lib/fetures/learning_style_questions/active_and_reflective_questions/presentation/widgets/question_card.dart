import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/api_services/question_api_service.dart';
import '../logic/questions_cubit.dart';
import '../logic/questions_state.dart';

class QuestionScreen extends StatelessWidget {
  final List<Map<String, int>> scoreOptions = [
    {'active': 100, 'reflective': 0},
    {'active': 75, 'reflective': 25},
    {'active': 50, 'reflective': 50},
    {'active': 25, 'reflective': 75},
    {'active': 0, 'reflective': 100},
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuestionCubit(QuestionsApiServices())..fetchQuestions(),
      child: Scaffold(
        appBar: AppBar(title: Text('Questions')),
        body: BlocBuilder<QuestionCubit, QuestionState>(
          builder: (context, state) {
            if (state is QuestionLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is QuestionLoaded) {
              final question = state.questions[state.currentQuestionIndex];
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      question.question,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            question.choice1,
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(5, (index) {
                            final activeValue = scoreOptions[index]['active']!;
                            final reflectiveValue = scoreOptions[index]['reflective']!;
                            return IconButton(
                              onPressed: () {
                                context.read<QuestionCubit>().nextQuestion(activeValue, reflectiveValue);
                              },
                              icon: Icon(Icons.circle, size: 10 + (index * 8)),
                            );
                          }),
                        ),
                        Expanded(
                          child: Text(
                            question.choice2,
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            } else if (state is QuestionResult) {
              return Center(
                child: Text(
                  'Final Results:\nActive Score: ${state.activeScore}\nReflective Score: ${state.reflectiveScore}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              );
            } else if (state is QuestionError) {
              return Center(child: Text(state.message));
            } else {
              return Center(child: Text('No questions available.'));
            }
          },
        ),
      ),
    );
  }
}
