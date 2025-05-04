import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';  // Generated file


@JsonSerializable()
class ProfileModel {
  int? id;
  String? name;
  String? email;

  @JsonKey(name: 'date_of_birth')
  DateTime? dateOfBirth;

  @JsonKey(name: 'registration_date')
  DateTime? registrationDate;

  @JsonKey(name: 'knowledge_level')
  dynamic knowledgeLevel;

  @JsonKey(name: 'learning_goals')
  dynamic learningGoals;

  @JsonKey(name: 'knowledge_base')
  dynamic knowledgeBase;

  @JsonKey(name: 'learning_style_active_reflective')
  double? learningStyleActiveReflective;

  @JsonKey(name: 'learning_style_visual_verbal')
  double? learningStyleVisualVerbal;

  @JsonKey(name: 'learning_style_sensing_intuitive')
  double? learningStyleSensingIntuitive;

  @JsonKey(name: 'learning_style_sequential_global')
  double? learningStyleSequentialGlobal;

  @JsonKey(name: 'preferred_learning_pace')
  String? preferredLearningPace;

  @JsonKey(name: 'engagement_score')
  int? engagementScore;

  @JsonKey(name: 'feedback_history')
  dynamic feedbackHistory;

  @JsonKey(name: 'last_active_date')
  DateTime? lastActiveDate;

  @JsonKey(name: 'Path')
  dynamic path;

  ProfileModel({
    this.id,
    this.name,
    this.email,
    this.dateOfBirth,
    this.registrationDate,
    this.knowledgeLevel,
    this.learningGoals,
    this.knowledgeBase,
    this.learningStyleActiveReflective,
    this.learningStyleVisualVerbal,
    this.learningStyleSensingIntuitive,
    this.learningStyleSequentialGlobal,
    this.preferredLearningPace,
    this.engagementScore,
    this.feedbackHistory,
    this.lastActiveDate,
    this.path,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
