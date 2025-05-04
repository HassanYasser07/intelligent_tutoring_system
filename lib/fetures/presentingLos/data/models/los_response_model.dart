import 'package:json_annotation/json_annotation.dart';

part 'los_response_model.g.dart';

@JsonSerializable()
class LOResponseModel {
  @JsonKey(name: 'lo_id')
  final int loId;
  
  @JsonKey(name: 'sub_los')
  final List<SubLO> subLos;

  LOResponseModel({
    required this.loId,
    required this.subLos,
  });

  factory LOResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LOResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LOResponseModelToJson(this);
}

@JsonSerializable()
class SubLO {
  final String material;
  final String name;

  SubLO({
    required this.material,
    required this.name,
  });

  factory SubLO.fromJson(Map<String, dynamic> json) => _$SubLOFromJson(json);

  Map<String, dynamic> toJson() => _$SubLOToJson(this);
}