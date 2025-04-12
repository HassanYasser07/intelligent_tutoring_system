import 'package:json_annotation/json_annotation.dart';

part 'result_model.g.dart';

@JsonSerializable()
class ResultModel {
  @JsonKey(name: 'learnerId')
  final int learnerId;
  
  @JsonKey(name: 'learning_style_active_reflective')
  final double learningStyleActiveReflective;
  
  @JsonKey(name: 'learning_style_visual_verbal')
  final double learningStyleVisualVerbal;
  
  @JsonKey(name: 'learning_style_sensing_intuitive')
  final double learningStyleSensingIntuitive;
  
  @JsonKey(name: 'learning_style_sequential_global')
  final double learningStyleSequentialGlobal;

  ResultModel({
    required this.learnerId,
    required this.learningStyleActiveReflective,
    required this.learningStyleVisualVerbal,
    required this.learningStyleSensingIntuitive,
    required this.learningStyleSequentialGlobal,
  });

  factory ResultModel.fromJson(Map<String, dynamic> json) => 
      _$ResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResultModelToJson(this);
}