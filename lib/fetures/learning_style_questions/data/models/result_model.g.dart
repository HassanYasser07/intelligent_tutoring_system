// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultModel _$ResultModelFromJson(Map<String, dynamic> json) => ResultModel(
      learnerId: (json['learnerId'] as num).toInt(),
      learningStyleActiveReflective:
          (json['learning_style_active_reflective'] as num).toDouble(),
      learningStyleVisualVerbal:
          (json['learning_style_visual_verbal'] as num).toDouble(),
      learningStyleSensingIntuitive:
          (json['learning_style_sensing_intuitive'] as num).toDouble(),
      learningStyleSequentialGlobal:
          (json['learning_style_sequential_global'] as num).toDouble(),
    );

Map<String, dynamic> _$ResultModelToJson(ResultModel instance) =>
    <String, dynamic>{
      'learnerId': instance.learnerId,
      'learning_style_active_reflective':
          instance.learningStyleActiveReflective,
      'learning_style_visual_verbal': instance.learningStyleVisualVerbal,
      'learning_style_sensing_intuitive':
          instance.learningStyleSensingIntuitive,
      'learning_style_sequential_global':
          instance.learningStyleSequentialGlobal,
    };
