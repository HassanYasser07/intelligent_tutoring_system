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













}