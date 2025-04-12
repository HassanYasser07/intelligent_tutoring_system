import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intelligent_tutoring_system/core/routing.dart';
import '../../data/api_services/questions_api_services.dart';
import '../logic/questions_cubit.dart';
import '../logic/questions_state.dart';

class QuestionScreen extends StatelessWidget {

  final List<Map<String, num>> scoreOptions = [
    {'active': 1, 'reflective': 0},
    {'active': .8, 'reflective': .2},
    {'active': .6, 'reflective': .4},
    {'active': .5, 'reflective': .5},
    {'active': .4, 'reflective': .6},
    {'active': .2, 'reflective': .8},
    {'active': 0, 'reflective': 1},

  ];


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuestionCubit(
        QuestionsApiServices(  Dio(),),

       
      )..fetchQuestions(''),
      child:Scaffold(
        appBar: AppBar(
          title: const Text('Questions', style: TextStyle(fontSize: 22)),
          backgroundColor: Colors.blueAccent,
        ),
        body: BlocBuilder<QuestionCubit, QuestionState>(
          builder: (context, state) {
            if (state is QuestionLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is QuestionLoaded) {
              final question = state.questions[state.currentQuestionIndex];
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          question.question!,
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 30),
                
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.grey),
                                  color: Colors.blue.shade100,
                                ),
                                child: Text(
                                  question.choice1!,
                                  style: const TextStyle(fontSize: 16),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                

                            const SizedBox(width: 10),
                
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.grey),
                                  color: Colors.orange.shade100,
                                ),
                                child: Text(
                                  question.choice2!,
                                  style: const TextStyle(fontSize: 16),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                
                           Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: List.generate(7, (index) {
                                    final scoreValue1 = scoreOptions[index]['active']!;
                                    final scoreValue2 = scoreOptions[index]['reflective']!;
                                    String dimension = question.dimension!;
                
                                    double buttonSize;
                                    if (index == 0 || index == 6) {
                                      buttonSize = 50;
                                    } else if (index == 1 || index == 5) {
                                      buttonSize = 40;
                                    } else if (index == 2 || index == 4) {
                                      buttonSize = 35;
                                    } else {
                                      buttonSize = 30;
                                    }
                                    Color buttonColor;
                                    if (index <= 2) {
                                      buttonColor = Colors.blue.shade100;
                                    } else if (index >= 4) {
                                      buttonColor = Colors.orange.shade100;
                                    } else {
                                      buttonColor = Colors.grey;
                                    }
                
                                    return GestureDetector(
                                      onTap: () {
                                        context.read<QuestionCubit>().nextQuestion(scoreValue1, scoreValue2, dimension);
                                      },
                                      child: Container(
                                        width: buttonSize,
                                        height: buttonSize,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: buttonColor,
                                        ),
                                        child: Icon(
                                          Icons.circle,
                                          size: buttonSize / 2,
                                          color: Colors.white,
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                
                              ]
                          ),
                
                      ],
                    ),
                  ),
                ),
              );
            } else if (state is QuestionResult) {
           //   context.go(Routes.kLessonView);  // Using the route constant from Routes class
          // GoRouter.of(context).push(Routes.kLessonView);
 WidgetsBinding.instance.addPostFrameCallback((_) {
    context.go(Routes.kShatBootView);  // Using the route constant from Routes class
  });
    return  const Center(child: CircularProgressIndicator());
            
            } else if (state is QuestionError) {
              return Center(child: Text(state.message, style: const TextStyle(color: Colors.red)));
            } else {
              return const Center(child: Text('No questions available.'));
            }
          },
        ),
      ),
    );
  }
}
