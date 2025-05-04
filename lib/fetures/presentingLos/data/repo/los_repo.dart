import 'package:intelligent_tutoring_system/fetures/presentingLos/data/api_services/los_api_services.dart';
import 'package:intelligent_tutoring_system/fetures/presentingLos/data/models/los_request_model.dart';
import 'package:intelligent_tutoring_system/fetures/presentingLos/data/models/los_response_model.dart';

class LORepository {
  final LOApiService _apiService;

  LORepository(this._apiService);

  Future<LOResponseModel> fetchSubLOs(int loId) async {
    try {
      final request = LORequestModel(loId: loId);
      final response = await _apiService.fetchSubLOs(request);
      return response;
    } catch (e) {
      throw Exception('Failed to fetch sub LOs: $e');
    }
  }
}