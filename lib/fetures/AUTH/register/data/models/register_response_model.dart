import 'package:json_annotation/json_annotation.dart';

part 'register_response_model.g.dart';

@JsonSerializable()
class RegisterResponseModel {
  final String message;
  final int learnerId;
  final String token;

  RegisterResponseModel({
    required this.message,
    required this.learnerId,
    required this.token,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseModelFromJson(json);
      
  Map<String, dynamic> toJson() => _$RegisterResponseModelToJson(this);
}