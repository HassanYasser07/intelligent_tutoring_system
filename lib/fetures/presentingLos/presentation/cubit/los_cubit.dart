import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_tutoring_system/fetures/presentingLos/data/repo/los_repo.dart';

import 'los_states.dart';

class LOsCubit extends Cubit<LOsState> {
  final LORepository _repository;

  LOsCubit(this._repository) : super(LOsInitial());

  Future<void> fetchSubLOs(int loId) async {
    emit(LOsLoading());
    try {
      final response = await _repository.fetchSubLOs(loId);
      emit(LOsSuccess(response));
    } catch (e) {
      emit(LOsError(e.toString()));
    }
  }
}