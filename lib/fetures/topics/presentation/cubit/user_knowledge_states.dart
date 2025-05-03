import 'package:equatable/equatable.dart';
import '../../data/models/user_path_response_model.dart';

abstract class UserKnowledgeState extends Equatable {
  const UserKnowledgeState();

  @override
  List<Object?> get props => [];
}

class UserKnowledgeInitial extends UserKnowledgeState {}

class UserKnowledgeLoading extends UserKnowledgeState {}

class UserKnowledgeSuccess extends UserKnowledgeState {
  final UserPathResponseModel response;

  const UserKnowledgeSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

class UserKnowledgeError extends UserKnowledgeState {
  final String message;

  const UserKnowledgeError(this.message);

  @override
  List<Object?> get props => [message];
}