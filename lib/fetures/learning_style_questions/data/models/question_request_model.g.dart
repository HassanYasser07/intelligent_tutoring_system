// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) =>
    QuestionModel(
      id: json['id'] as String?,
      question: json['question'] as String?,
      choice1: json['choice1'] as String?,
      choice2: json['choice2'] as String?,
      dimension: json['dimension'] as String?,
    );

Map<String, dynamic> _$QuestionModelToJson(QuestionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'choice1': instance.choice1,
      'choice2': instance.choice2,
      'dimension': instance.dimension,
    };
