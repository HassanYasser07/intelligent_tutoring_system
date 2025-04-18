import 'package:json_annotation/json_annotation.dart';

part 'token_verify_response.g.dart';

@JsonSerializable()
class TokenVerifyResponse {
  final String message;
  final UserData? user;

  TokenVerifyResponse({
    required this.message,
    this.user,
  });

  Map<String, dynamic> toJson() => _$TokenVerifyResponseToJson(this);

  factory TokenVerifyResponse.fromJson(Map<String, dynamic> json) =>
      _$TokenVerifyResponseFromJson(json);
}

@JsonSerializable()
class UserData {
  final int id;
  final String email;
  final int iat;
  final int exp;

  UserData({
    required this.id,
    required this.email,
    required this.iat,
    required this.exp,
  });

  Map<String, dynamic> toJson() => _$UserDataToJson(this);

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}