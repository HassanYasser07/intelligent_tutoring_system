import 'package:json_annotation/json_annotation.dart';

part 'los_request_model.g.dart';

@JsonSerializable()
class LORequestModel {
  @JsonKey(name: 'lo_id')
  final int loId;

  LORequestModel({required this.loId});

  factory LORequestModel.fromJson(Map<String, dynamic> json) =>
      _$LORequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$LORequestModelToJson(this);
}