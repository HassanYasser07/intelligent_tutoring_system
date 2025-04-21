import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intelligent_tutoring_system/core/routing.dart';
import '../../data/api_services/questions_api_services.dart';
import '../logic/questions_cubit.dart';
import '../logic/questions_state.dart';

class QuestionScreen extends StatefulWidget {
  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _heightAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _positionAnimation;

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
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _heightAnimation = Tween<double>(begin: 100.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
    _fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
    _positionAnimation = Tween<double>(begin: -115.0, end: -300.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuestionCubit(QuestionsApiServices(Dio()))..fetchQuestions(''),
      child: Scaffold(
        body: BlocBuilder<QuestionCubit, QuestionState>(
          builder: (context, state) {
            if (state is QuestionLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is QuestionResult) {
              WidgetsBinding.instance.addPostFrameCallback((_) {

                context.pushReplacement('${Routes.kResultView}', extra: {
                  'activeReflectiveResult': state.activeReflectiveScore,
                  'reflectiveResult': state.reflectiveScore,
                  'visualVerbalResult': state.visualVerbalScore,
                  'verbalResult': state.verbalScore,
                  'sensingIntuitiveResult': state.sensingIntuitiveScore,
                  'sensingResult': state.sensingScore,
                  'sequentialGlobalResult': state.sequentialGlobalScore,
                  'globalResult': state.globalScore,
                });
              });
              return const Center(child: CircularProgressIndicator());
            } else if (state is QuestionLoaded) {
              final question = state.questions[state.currentQuestionIndex];
              return SafeArea(
                child: Stack(
                  children: [
                    AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        return Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFb7e67e),
                                Color(0xFF58cc02),
                              ],
                              begin: Alignment.topRight,
                              end: Alignment.topLeft,
                            ),
                          ),

                        );
                      },
                    ),
                    AnimatedBuilder(
                      animation: _heightAnimation,
                      builder: (context, child) {
                        return Container(
                          height: double.infinity,
                          margin: EdgeInsets.only(top: _heightAnimation.value),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(_heightAnimation.value > 0 ? 40 : 0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Stack(
                              clipBehavior: Clip.none,


                              children: [
                                AnimatedBuilder(
                                  animation: _positionAnimation,
                                  builder: (context, child) {
                                    return Positioned(
                                      top: _positionAnimation.value,
                                      left: -40,
                                      child: Opacity(
                                        opacity: _fadeAnimation.value,
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              "assets/me.png",
                                              width: 130,
                                              height: 100,
                                            ),
                                            const Text(
                                              'hfhs fdsih fhis sdihfsishf fs \n gfuifgi',
                                              style: TextStyle(color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 20,),
                                    // Progress Bar
                                    Container(
                                      height: 11,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF58CC02),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: FractionallySizedBox(
                                        alignment: Alignment.centerLeft,
                                        widthFactor: (state.currentQuestionIndex ) / state.questions.length,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFFFC800),
                                            borderRadius: BorderRadius.circular(4),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 30),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        question.question!,
                                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    const SizedBox(height: 30),
                                    Expanded(
                                      flex: 5,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              height: 180,
                                              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8),
                                                border: Border.all(color: Color(0xFF84D8FF)),
                                                color: Color(0xFFDDF4FF),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color(0xFF84D8FF), // ظل واضح أكثر
                                                    blurRadius: 2, // ضبابية أكثر
                                                    spreadRadius: 2, // انتشاره حول العنصر
                                                    offset: Offset(0, 2), // ينسدل للأسفل
                                                  )
                                                ],
                                              ),
                                              child: Center(
                                                child: Text(
                                                  question.choice1!,
                                                  style: const TextStyle(fontSize: 16),
                                                  textAlign: TextAlign.start,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: Container(
                                              height: 180,
                                              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8),
                                                border: Border.all(color: Color(0xFFFFEC84)),
                                                color: Color(0xFFFFFADD),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color(0xFFFFEC84), // ظل واضح أكثر
                                                    blurRadius: 2, // ضبابية أكثر
                                                    spreadRadius: 2, // انتشاره حول العنصر
                                                    offset: Offset(0, 2), // ينسدل للأسفل
                                                  )
                                                ],
                                              ),
                                              child: Center(
                                                child: Text(
                                
                                                  question.choice2!,
                                                  style: const TextStyle(fontSize: 16),
                                                  textAlign: TextAlign.start,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 30),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
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
                                                buttonColor = Color(0xFF006FA3);
                                              } else if (index >= 4) {
                                                buttonColor = Color(0xFFD3B200);
                                              } else {
                                                buttonColor = Color(0xFFC3C3C3);
                                              }

                                              return GestureDetector(
                                                onTap: () {
                                                  print("scoreValue1: $scoreValue1, scoreValue2: $scoreValue2");
                                                  if (state.currentQuestionIndex == 0 ) {
                                                    _animationController.forward();
                                                  }
                                                  context.read<QuestionCubit>().nextQuestion(scoreValue1, scoreValue2, dimension);
                                                },
                                                child: Container(
                                                  width: buttonSize,
                                                  height: buttonSize,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: buttonColor, // نفس اللون اللي كنت تستخدمه
                                                      width: 3, // سماكة الخط
                                                    ),
                                                  ),
                                                ),

                                              );
                                            }),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),

                  ],
                ),
              );
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
