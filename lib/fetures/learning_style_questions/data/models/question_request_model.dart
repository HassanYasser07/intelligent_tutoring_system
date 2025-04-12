import 'package:freezed_annotation/freezed_annotation.dart';
part 'question_request_model.g.dart';

@JsonSerializable()
class QuestionModel{
 String? id;
 String? question;
 String? choice1;
 String? choice2;
 String? dimension;

  QuestionModel({required this.id, required this.question, required this.choice1, required this.choice2, required this.dimension});


factory QuestionModel.fromJson(Map<String,dynamic>json)=>
    _$QuestionModelFromJson(json);
}

