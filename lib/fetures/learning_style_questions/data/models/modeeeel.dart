
// تعريف الـ Model لتمثيل البيانات
class QuestionModell {
  final String id;
  final String question;
  final String choice1;
  final String choice2;
  final String dimension;

  QuestionModell({
    required this.id,
    required this.question,
    required this.choice1,
    required this.choice2,
    required this.dimension,
  });

  // دالة لتحويل البيانات من JSON إلى كائن Dart
  factory QuestionModell.fromJson(Map<String, dynamic> json) {
    return QuestionModell(
      id: json['_id'] as String,
      question: json['question'] as String,
      choice1: json['choice1'] as String,
      choice2: json['choice2'] as String,
      dimension: json['dimension'] as String,
    );
  }
}














