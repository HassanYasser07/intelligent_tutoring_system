import 'package:dio/dio.dart';

import '../models/modeeeel.dart';

class QuestionsApiServices {
  final Dio _dio = Dio();

  // دالة لجلب الأسئلة من API وتحليلها إلى قائمة من كائنات Question
  Future<List<QuestionModell>> fetchQuestions(String dimension) async {
    try {
      final response = await _dio.get('http://192.168.1.60:3000/questions/'); // استبدل 'https://your-api-url.com/questions' بالرابط الفعلي للـ API
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
  }) async {
    final url = 'http://localhost:3000/learningStyleProfile'; // استبدل هذا بالرابط الفعلي لـ API

    // بيانات الإرسال
    final data = {
      "activeScore": activeScore,
      "reflectiveScore": reflectiveScore,
      "sensingScore": visualScore,
      "intuitiveScore": verbalScore,
      "sequentialScore": sequentialScore,
      "globalScore": globalScore,
      "visualScore": intuitiveScore,
      "verbalScore": sensingScore,
    };

    try {
      // إرسال البيانات باستخدام POST
      final response = await _dio.post(url, data: data);
      print("Result sent successfully: ${response.data}");
    } catch (e) {
      print("Failed to send results: $e");
    }
  }






}