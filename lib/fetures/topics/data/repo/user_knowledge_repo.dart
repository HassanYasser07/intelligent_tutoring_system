// import 'package:dartz/dartz.dart';
// import '../api_services/user_knowledge_api_services.dart';
// import '../models/user_knowledge_request_model.dart';
// import '../models/user_path_response_model.dart';
// import '../../../../core/error/failures.dart';
//
// class UserKnowledgeRepository {
//   final UserKnowledgeApiServices _apiServices;
//
//   UserKnowledgeRepository(this._apiServices);
//
//   Future<Either<Failure, UserPathResponseModel>> getBestPath(
//       UserKnowledgeRequestModel request) async {
//     try {
//       final response = await _apiServices.getBestPath(request);
//       return Right(response);
//     } catch (e) {
//       return Left(ServerFailure());
//     }
//   }
// }