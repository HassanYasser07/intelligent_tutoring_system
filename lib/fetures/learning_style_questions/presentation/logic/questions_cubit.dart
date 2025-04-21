import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_tutoring_system/core/helper/token_storage.dart';
import 'package:intelligent_tutoring_system/fetures/learning_style_questions/data/models/result_model.dart';
import 'package:intelligent_tutoring_system/fetures/learning_style_questions/presentation/logic/questions_state.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../../data/api_services/questions_api_services.dart';

class QuestionCubit extends Cubit<QuestionState> {
  final QuestionsApiServices apiService;
  num reflectiveScore = 0;
  num verbalScore = 0;
  num globalScore = 0;
  num intuitiveScore = 0;

  num activeReflectiveScore = 0;
  num visualVerbalScore = 0;
  num sensingIntuitiveScore = 0;
  num sequentialGlobalScore = 0;

  QuestionCubit(this.apiService,) : super(QuestionInitial());

  Future<void> fetchQuestions(String dimension) async {
    try {
      emit(QuestionLoading());
      final questions = await apiService.getQuestions();
      emit(QuestionLoaded(questions, dimension));
    } catch (e) {
      print("what is /////////////////////////////////   ${e.toString()}");
      emit(const QuestionError("Failed to load questions"));
    }
  }

  void nextQuestion(num scoreValue1, num scoreValue2, String dimension) async {
    if (state is QuestionLoaded) {
      final currentState = state as QuestionLoaded;
      if (dimension == "active&reflective") {
        activeReflectiveScore += scoreValue1;
        reflectiveScore += scoreValue2;
      } else if (dimension == "intuitive&sensing") {
        sensingIntuitiveScore += scoreValue1;
        intuitiveScore += scoreValue2;
      } else if (dimension == "sequential&global") {
        sequentialGlobalScore += scoreValue1;
        globalScore += scoreValue2;
      } else if (dimension == "visual&verbal") {
        visualVerbalScore += scoreValue1;
        verbalScore += scoreValue2;
      }

      final newIndex = currentState.currentQuestionIndex + 1;


      if (newIndex < currentState.questions.length) {
        emit(currentState.copyWith(currentQuestionIndex: newIndex));
      } else {
        final activeReflectiveResult = double.parse((activeReflectiveScore / 2).toStringAsFixed(2));
        final reflectiveResult = double.parse((1-activeReflectiveResult).toStringAsFixed(2));

        final visualVerbalResult = double.parse((visualVerbalScore / 2).toStringAsFixed(2));
        final verbalResult = double.parse((1-visualVerbalResult).toStringAsFixed(2));

        final sensingIntuitiveResult = double.parse((sensingIntuitiveScore / 2).toStringAsFixed(2));
        final intuitiveResult = double.parse((1-sensingIntuitiveResult).toStringAsFixed(2));

        final sequentialGlobalResult = double.parse((sequentialGlobalScore / 2).toStringAsFixed(2));
        final globalResult = double.parse((1-sequentialGlobalResult).toStringAsFixed(2));

        print(
            "activeReflectiveScore ${activeReflectiveResult} "
                "reflectiveScore ${reflectiveResult} "
                "visualVerbalScore ${visualVerbalResult} "
                "verbalScore ${verbalResult} "
                "sequentialGlobalScore ${sequentialGlobalResult} "
                "globalScore ${globalResult} "
                "sensingIntuitiveScore ${sensingIntuitiveResult} "
                "intuitiveScore ${intuitiveResult} "
        );

        emit(QuestionResult(
            activeReflectiveResult,
            visualVerbalResult,
            sensingIntuitiveResult,
            sequentialGlobalResult,
            verbalResult,
            globalResult,
            intuitiveResult,
            reflectiveResult
        ));
        try {
          // Get token from storage
          final token = await AppStorage.getToken();
          if (token == null) {
            emit(const QuestionError("No authentication token found"));
            return;
          }

          // Decode token to get user ID
          final Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
          final int userId = decodedToken['id'];
          final String email = decodedToken['email'];


          final result = ResultModel(
            learnerId: userId,
            learningStyleActiveReflective: activeReflectiveResult,
            learningStyleVisualVerbal: visualVerbalResult,
            learningStyleSensingIntuitive: sensingIntuitiveResult,
            learningStyleSequentialGlobal: sequentialGlobalResult,
          );
          print(': ${result.learnerId}');
          print(email);



          // Replace 'YOUR_TOKEN_HERE' with actual token retrieval logic
          await apiService.updateLearningStyles(result, 'Bearer $token');
            print('Learning styles updated successfully');
              if (!isClosed) {
            print('Learning styles updated successfully');




          }
        } catch (e) {
          print('Failed to update learning styles: ${e.toString()}');
          emit( QuestionError("Failed to update learning styles ${e.toString()} "));
        }
      }
    }
  }
}
