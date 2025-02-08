import 'package:dio/dio.dart';
import '../models/modeeeel.dart';

class QuestionsApiServices {
  final Dio _dio = Dio();

  Future<List<QuestionModell>> fetchQuestions(String dimension) async {
    try {
      final response = await _dio.get('http://192.168.1.8:3000/questions/'); // استبدل 'https://your-api-url.com/questions' بالرابط الفعلي للـ API
      final List data = response.data as List;
      return data.map((json) => QuestionModell.fromJson(json)).toList();
    } catch (e) {
      print("Error fetching questions: $e");
      return [];
    }
  }




  Future<void> postResults({
    required int activeScore,
    required int reflectiveScore,
    required int visualScore,
    required int verbalScore,
    required int sequentialScore,
    required int globalScore,
    required int intuitiveScore,
    required int sensingScore,
  }
  ) async {
    final url = 'http://192.168.1.6:3000/learningStyleProfile';

    final data = {
      "activeScore": activeScore,
      "reflectiveScore": reflectiveScore,
      "sensingScore": sensingScore,
      "intuitiveScore":intuitiveScore ,
      "sequentialScore": sequentialScore,
      "globalScore": globalScore,
      "visualScore": visualScore,
      "verbalScore": verbalScore,
    };

    try {
      final response = await _dio.post(url, data: data);
      print("Result sent successfully: ${response.data}");
    } catch (e) {
      print("Failed to send results: $e");
    }
  }
}