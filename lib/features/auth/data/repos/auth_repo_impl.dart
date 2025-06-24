import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/services/api_service.dart';
import '../models/user_model.dart';
import '../../domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService apiService;

  AuthRepoImpl(this.apiService);

  @override
  Future<Either<Failures, Map<String, dynamic>>> signup({
    required UserModel userModel,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.post(
        endPoint: 'Register?',
        data: userModel.toJson(),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      print('Response from signup: $response');

      // final UserModel registeredUser = UserModel.fromJson(response);

      // return right(registeredUser);
      return right(response);
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