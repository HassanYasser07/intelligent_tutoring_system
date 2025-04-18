// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_verify_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenVerifyResponse _$TokenVerifyResponseFromJson(Map<String, dynamic> json) =>
    TokenVerifyResponse(
      message: json['message'] as String,
      user: json['user'] == null
          ? null
          : UserData.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TokenVerifyResponseToJson(
        TokenVerifyResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'user': instance.user,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      iat: (json['iat'] as num).toInt(),
      exp: (json['exp'] as num).toInt(),
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'iat': instance.iat,
      'exp': instance.exp,
    };
