// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_path_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LearningObject _$LearningObjectFromJson(Map<String, dynamic> json) =>
    LearningObject(
      loId: (json['lo_id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$LearningObjectToJson(LearningObject instance) =>
    <String, dynamic>{
      'lo_id': instance.loId,
      'name': instance.name,
    };

UserPathResponseModel _$UserPathResponseModelFromJson(
        Map<String, dynamic> json) =>
    UserPathResponseModel(
      learningObjects: (json['learning_objects'] as List<dynamic>)
          .map((e) => LearningObject.fromJson(e as Map<String, dynamic>))
          .toList(),
      pathIndex: (json['path_index'] as num).toInt(),
    );

Map<String, dynamic> _$UserPathResponseModelToJson(
        UserPathResponseModel instance) =>
    <String, dynamic>{
      'learning_objects': instance.learningObjects,
      'path_index': instance.pathIndex,
    };
