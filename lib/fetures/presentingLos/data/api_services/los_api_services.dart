import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/los_request_model.dart';
import '../models/los_response_model.dart';

part 'los_api_services.g.dart';

@RestApi(baseUrl: "https://iia-git-master-tarek-saads-projects.vercel.app/")
abstract class LOApiService {
  factory LOApiService(Dio dio, {String baseUrl}) = _LOApiService;

  @POST("/fetch/lo/child-sub-los")
  Future<LOResponseModel> fetchSubLOs(
    @Body() LORequestModel request,
  );
}