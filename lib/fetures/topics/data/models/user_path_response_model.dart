import 'package:json_annotation/json_annotation.dart';

part 'user_path_response_model.g.dart';

@JsonSerializable()
class LearningObject {
  @JsonKey(name: 'lo_id')
  final int loId;
  final String name;

  LearningObject({
    required this.loId,
    required this.name,
  });

  factory LearningObject.fromJson(Map<String, dynamic> json) =>
      _$LearningObjectFromJson(json);

  Map<String, dynamic> toJson() => _$LearningObjectToJson(this);
}

@JsonSerializable()
class UserPathResponseModel {
  @JsonKey(name: 'learning_objects')
  final List<LearningObject> learningObjects;
  
  @JsonKey(name: 'path_index')
  final int pathIndex;

  UserPathResponseModel({
    required this.learningObjects,
    required this.pathIndex,
  });

  factory UserPathResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserPathResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserPathResponseModelToJson(this);
}