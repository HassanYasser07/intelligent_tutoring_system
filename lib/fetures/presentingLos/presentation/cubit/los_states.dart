
import 'package:intelligent_tutoring_system/fetures/presentingLos/data/models/los_response_model.dart';

abstract class LOsState {}

class LOsInitial extends LOsState {}

class LOsLoading extends LOsState {}

class LOsSuccess extends LOsState {
  final LOResponseModel response;

  LOsSuccess(this.response);
}

class LOsError extends LOsState {
  final String message;

  LOsError(this.message);
}