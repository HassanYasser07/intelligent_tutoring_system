import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_tutoring_system/fetures/learning_style_questions/active_and_reflective_questions/presentation/logic/questions_state.dart';
import '../../data/api_services/question_api_service.dart';

class QuestionCubit extends Cubit<QuestionState> {
  final QuestionsApiServices apiService;
  int activeScore = 0;
  int reflectiveScore = 0;
  int visualScore = 0;
  int verbalScore = 0;
  int sequentialScore = 0;
  int globalScore = 0;
  int intuitiveScore = 0;
  int sensingScore = 0;

  QuestionCubit(this.apiService) : super(QuestionInitial());

  Future<void> fetchQuestions(String dimension) async {
    try {
      emit(QuestionLoading());
      final questions = await apiService.fetchQuestions(dimension);
      emit(QuestionLoaded(questions, dimension));
    } catch (e) {
      emit(const QuestionError("Failed to load questions"));
    }
  }

  void nextQuestion(int scoreValue1, int scoreValue2, String dimension) {
    if (state is QuestionLoaded) {
      final currentState = state as QuestionLoaded;
      if (dimension == "active&reflective") {
        activeScore += scoreValue1;
        reflectiveScore += scoreValue2;
      } else if (dimension == "intuitive&sensing") {
        intuitiveScore += scoreValue1;
        sensingScore += scoreValue2;
      } else if (dimension == "sequential&global") {
        sequentialScore += scoreValue1;
        globalScore += scoreValue2;
      } else if (dimension == "visual&verbal") {
        visualScore += scoreValue1;
        verbalScore += scoreValue2;
      }

      final newIndex = currentState.currentQuestionIndex + 1;

      if (newIndex < currentState.questions.length) {
        emit(currentState.copyWith(currentQuestionIndex: newIndex));
      } else {
        // عرض النتيجة النهائية بعد الإجابة عن جميع الأسئلة
        emit(QuestionResult(
            activeScore,
            reflectiveScore,
            visualScore,
            verbalScore,
            sequentialScore,
            globalScore,
            intuitiveScore,
            sensingScore));
      }
    }
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intelligent_tutoring_system/fetures/learning_style_questions/active_and_reflective_questions/data/models/question_request_model.dart';
// import '../../domain/repos/question_repo.dart';
// part 'questions_state.dart';
//
// class QuestionsCubit extends Cubit<QuestionsState> {
//   final QuestionRepo questionRepo;
//   QuestionsCubit(this.questionRepo) : super(QuestionsInitial());
//   void getQuestions()async{
//     emit(QuestionsLoading());
//     var response = await questionRepo.getQuestions();
//     response.fold((failure){
//       emit(QuestionsFailure(failure.errMessage));
//     }, (success){
//       emit(QuestionsSuccess(success));
//     });
//
//   }
// }

// class QuestionsCubit extends Cubit<QuestionsState> {
//   final Dio _dio;
//
//   QuestionsCubit(this._dio) : super(QuestionsInitial());
//
//   Future<void> getQuestions() async {
//     emit(QuestionsLoading()); // حالة تحميل
//     try {
//       final response = await _dio.get('http://192.168.1.60:3000/questions/active&reflective');
//       List<QuestionModell> questions = (response.data as List)
//           .map((questionData) => QuestionModell.fromJson(questionData))
//           .toList();
//       emit(QuestionsSuccess(questions,)); // حالة نجاح
//     } catch (e) {
//       emit(QuestionsFailure('Error fetching questions: $e')); // حالة فشل
//     }
//   }
// }
