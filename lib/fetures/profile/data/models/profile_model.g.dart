// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      dateOfBirth: json['date_of_birth'] == null
          ? null
          : DateTime.parse(json['date_of_birth'] as String),
      registrationDate: DateTime.parse(json['registration_date'] as String),
      knowledgeLevel: json['knowledge_level'],
      learningGoals: json['learning_goals'],
      knowledgeBase: json['knowledge_base'],
      learningStyleActiveReflective:
          (json['learning_style_active_reflective'] as num).toDouble(),
      learningStyleVisualVerbal:
          (json['learning_style_visual_verbal'] as num).toDouble(),
      learningStyleSensingIntuitive:
          (json['learning_style_sensing_intuitive'] as num).toDouble(),
      learningStyleSequentialGlobal:
          (json['learning_style_sequential_global'] as num).toDouble(),
      preferredLearningPace: json['preferred_learning_pace'] as String?,
      engagementScore: (json['engagement_score'] as num).toInt(),
      feedbackHistory: json['feedback_history'],
      lastActiveDate: DateTime.parse(json['last_active_date'] as String),
      path: json['path'],
    );

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'date_of_birth': instance.dateOfBirth?.toIso8601String(),
      'registration_date': instance.registrationDate?.toIso8601String(),
      'knowledge_level': instance.knowledgeLevel,
      'learning_goals': instance.learningGoals,
      'knowledge_base': instance.knowledgeBase,
      'learning_style_active_reflective':
          instance.learningStyleActiveReflective,
      'learning_style_visual_verbal': instance.learningStyleVisualVerbal,
      'learning_style_sensing_intuitive':
          instance.learningStyleSensingIntuitive,
      'learning_style_sequential_global':
          instance.learningStyleSequentialGlobal,
      'preferred_learning_pace': instance.preferredLearningPace,
      'engagement_score': instance.engagementScore,
      'feedback_history': instance.feedbackHistory,
      'last_active_date': instance.lastActiveDate?.toIso8601String(),
      'path': instance.path,
    };
