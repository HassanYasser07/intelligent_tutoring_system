import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/api_services/question_api_service.dart';
import '../logic/questions_cubit.dart';
import '../logic/questions_state.dart';

class QuestionScreen extends StatelessWidget {

  final List<Map<String, int>> scoreOptions = [
    {'active': 100, 'reflective': 0},
    {'active': 80, 'reflective': 20},
    {'active': 60, 'reflective': 40},
    {'active': 50, 'reflective': 50},
    {'active': 20, 'reflective': 80},
    {'active': 40, 'reflective': 60},
    {'active': 0, 'reflective': 100},

  ];


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuestionCubit(QuestionsApiServices())..fetchQuestions(''),
      child:Scaffold(
        appBar: AppBar(
          title: Text('Questions', style: TextStyle(fontSize: 22)),
          backgroundColor: Colors.blueAccent,
        ),
        body: BlocBuilder<QuestionCubit, QuestionState>(
          builder: (context, state) {
            if (state is QuestionLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is QuestionLoaded) {
              final question = state.questions[state.currentQuestionIndex];
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // عرض السؤال
                        Text(
                          question.question,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 30),
                
                        // عرض الاختيارات (Choice 1 و Choice 2)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // الاختيار الأول
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.grey),
                                  color: Colors.blue.shade100,
                                ),
                                child: Text(
                                  question.choice1,
                                  style: TextStyle(fontSize: 16),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                
                            // الأزرار التفاعلية
                
                            SizedBox(width: 10),
                
                            // الاختيار الثاني
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.grey),
                                  color: Colors.orange.shade100,
                                ),
                                child: Text(
                                  question.choice2,
                                  style: TextStyle(fontSize: 16),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                
                           Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: List.generate(7, (index) {
                                    final scoreValue1 = scoreOptions[index]['active']!;
                                    final scoreValue2 = scoreOptions[index]['reflective']!;
                                    String dimension = question.dimension;
                
                                    // تحديد حجم الزر بناءً على الفهرس
                                    double buttonSize;
                                    if (index == 0 || index == 6) {
                                      buttonSize = 50; // الأزرار على الجانبين
                                    } else if (index == 1 || index == 5) {
                                      buttonSize = 40; // الأزرار التالية
                                    } else if (index == 2 || index == 4) {
                                      buttonSize = 35; // الأزرار الأقرب للوسط
                                    } else {
                                      buttonSize = 30; // الزر في المنتصف
                                    }
                                    // تحديد لون الزر بناءً على موقعه
                                    Color buttonColor;
                                    if (index <= 2) {
                                      buttonColor = Colors.blue.shade100; // الأزرار اليمنى
                                    } else if (index >= 4) {
                                      buttonColor = Colors.orange.shade100; // الأزرار اليسرى
                                    } else {
                                      buttonColor = Colors.grey; // الزر الأوسط
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
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Final Results',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blueAccent),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      // عرض الدرجات
                      Text(
                        'Active Score: ${state.activeScore}\n'
                            'Reflective Score: ${state.reflectiveScore}\n'
                            'Sensing Score: ${state.sensingScore}\n'
                            'Intuitive Score: ${state.intuitiveScore}\n'

                            'Sequential Score: ${state.sequentialScore}\n'
                            'Global Score: ${state.globalScore}\n'
                            'Visual Score: ${state.visualScore}\n'
                            'Verbal Score: ${state.verbalScore}\n',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is QuestionError) {
              return Center(child: Text(state.message, style: TextStyle(color: Colors.red)));
            } else {
              return Center(child: Text('No questions available.'));
            }
          },
        ),
      ),













      // Scaffold(
      //   appBar: AppBar(title: Text('Questions')),
      //   body: BlocBuilder<QuestionCubit, QuestionState>(
      //     builder: (context, state) {
      //       if (state is QuestionLoading) {
      //         return Center(child: CircularProgressIndicator());
      //       } else if (state is QuestionLoaded) {
      //         final question = state.questions[state.currentQuestionIndex];
      //         return Padding(
      //           padding: const EdgeInsets.all(16.0),
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             children: [
      //               Text(
      //                 question.question,
      //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      //                 textAlign: TextAlign.center,
      //               ),
      //               SizedBox(height: 20),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [
      //                   Expanded(
      //                     child: Text(
      //                       question.choice1,
      //                       style: TextStyle(fontSize: 16),
      //                       textAlign: TextAlign.start,
      //                     ),
      //                   ),
      //                   Row(
      //                     mainAxisAlignment: MainAxisAlignment.center,
      //                     children: List.generate(7, (index) {
      //                       final scoreValue1 = scoreOptions[index]['active']!;
      //                       final scoreValue2 = scoreOptions[index]['reflective']!;
      //                       String dimension = question.dimension; // ضع البُعد المناسب هنا
      //                       return IconButton(
      //                         onPressed: () {
      //                           context.read<QuestionCubit>().nextQuestion(scoreValue1, scoreValue2,dimension);
      //                         },
      //                         icon: Icon(Icons.circle, size: 10 ),
      //                       );
      //                     }),
      //                   ),
      //                   Expanded(
      //                     child: Text(
      //                       question.choice2,
      //                       style: TextStyle(fontSize: 16),
      //                       textAlign: TextAlign.end,
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ],
      //           ),
      //         );
      //       } else if (state is QuestionResult) {
      //         return Center(
      //           child: Text(
      //             'Final Results:\n'
      //
      //                 'Active Score: ${state.activeScore}\n'
      //                 'Reflective Score: ${state.reflectiveScore}\n'
      //
      //                 'Intuitive Score: ${state.intuitiveScore}\n'
      //                 'sensing Score: ${state.sensingScore}\n'
      //
      //                 'Sequential Score: ${state.sequentialScore}\n'
      //                 'Global Score: ${state.globalScore}\n'
      //
      //                 'Visual Score: ${state.visualScore}\n'
      //                 'Verbal Score : ${state.verbalScore}\n'
      //
      //             ,
      //             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      //             textAlign: TextAlign.center,
      //           ),
      //         );
      //       } else if (state is QuestionError) {
      //         return Center(child: Text(state.message));
      //       } else {
      //         return Center(child: Text('No questions available.'));
      //       }
      //     },
      //   ),
      // ),
    );
  }
}
