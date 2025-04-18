import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final String message;
  final int learnerId;
  final String token;

  LoginResponse({
    required this.message,
    required this.learnerId,
    required this.token,
  });

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}