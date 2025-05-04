
import '../apiServices/profile_api_services.dart';
import '../models/profile_model.dart';

class ProfileRepo {
  final ProfileApiService apiService;

  ProfileRepo(this.apiService);

  Future<ProfileModel> getProfile(String email) async {
    try {
      return await apiService.getUserProfile(email);
    } catch (e) {
      throw Exception('Failed to load profile: $e');
    }
  }
}
