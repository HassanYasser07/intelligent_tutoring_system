// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'los_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LOResponseModel _$LOResponseModelFromJson(Map<String, dynamic> json) =>
    LOResponseModel(
      loId: (json['lo_id'] as num).toInt(),
      subLos: (json['sub_los'] as List<dynamic>)
          .map((e) => SubLO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LOResponseModelToJson(LOResponseModel instance) =>
    <String, dynamic>{
      'lo_id': instance.loId,
      'sub_los': instance.subLos,
    };

SubLO _$SubLOFromJson(Map<String, dynamic> json) => SubLO(
      material: json['material'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$SubLOToJson(SubLO instance) => <String, dynamic>{
      'material': instance.material,
      'name': instance.name,
    };
