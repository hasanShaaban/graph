import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graph/core/errors/failures.dart';
import 'package:graph/core/services/api_service.dart';
import 'package:graph/features/auth/data/models/user_model.dart';
import 'package:graph/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService apiService;

  AuthRepoImpl(this.apiService);

  @override
  Future<Either<Failures, UserModel>> signup({
    required UserModel userModel,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.post(
        endPoint: 'Register',
        data: userModel.toJson(),
      );

      print('Response from signup: $response');

      final UserModel registeredUser = UserModel.fromJson(response);

      return right(registeredUser);
    } catch (e) {
      if (e is DioException) {
        print('Dio exception: ${e.response?.data}');
        return left(ServerFailure.fromDioError(e));
      }
      print('Unexpected error: $e');
      return left(ServerFailure(e.toString()));
    }
  }
}






//  Future<Either<Failuer, RegistrationResponse>> signupRequest(
//       {required RegistrationModel registrationModel}) async {
//     try {
//       var data = await apiService.postSignUp(
//           endPoints: 'register?', registrationModel: registrationModel);
//       RegistrationResponse response = RegistrationResponse.fromJson(data);
//       return right(response);
//     } catch (e) {
//       if (e is DioException) {
//         return left(ServerFailuer.fromDioExceptio(e));
//       }
//       return left(ServerFailuer(e.toString()));
//     }
//   }