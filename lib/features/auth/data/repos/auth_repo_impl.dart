import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graph/features/auth/data/models/social_links_model.dart';
import '../../../../core/services/local_data_base/hive_data_base_service.dart';
import '../models/company_model.dart';
import '../models/credintials_model.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/services/api_service.dart';
import '../../domain/repos/auth_repo.dart';
import '../models/user_model.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService apiService;

  AuthRepoImpl(this.apiService);

  //Email and password
  @override
  Future<Either<Failures, Map<String, dynamic>>> credintials({
    required CredintialsModel credintialsModel,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.post(
        endPoint: 'user/credintials',
        data: credintialsModel.toJson(),

        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );
      //.timeout(Duration(seconds: 120));

      print('Response from credintials: $response');
      log(
        'Response from credintials: $response',
        name: 'AuthRepoImpl.credintials',
      );
      return right(response);
    } catch (e) {
      if (e is DioException) {
        print("Dio exception: ${e.message}");
        print("Status code: ${e.response?.statusCode}");

        print('Dio exception: ${e.response?.data}');
        return left(ServerFailure.fromDioError(e));
      }
      print('Unexpected error: $e');

      log(
        'Unexpected error in credintials',
        name: 'AuthRepoImpl.credintials',
        error: e,
        stackTrace: StackTrace.current,
      );
      return left(ServerFailure(e.toString()));
    }
  }

  //Signup for student account
  @override
  Future<Either<Failures, Map<String, dynamic>>> signup({
    required UserModel userModel,
  }) async {
    try {
      final token = await HiveDataBaseService().getData(
        boxName: 'authBox',
        key: 'token',
      );
      final file = userModel.image;

      FormData formData = FormData.fromMap({
        'first_name': userModel.firstName,
        'last_name': userModel.lastName,
        'birth_date': userModel.dateOfBirht,
        'gender': userModel.gender,
        'year_id': userModel.studyYear,
        'major_id': userModel.spacialization,
        if (file != null)
          'profile_image': await MultipartFile.fromFile(
            file.path,
            filename: file.path.split('/').last,
          ),
      });
      Map<String, dynamic> response = await apiService.post(
        endPoint: 'Register',

        // data: userModel.toJson(),
        data: formData,

        options: Options(
          headers: {
            'Authorization': 'Bearer $token',

            'Content-Type': 'multipart/form-data',
            'Accept': 'application/json',
          },
        ),
      );
      print('Response from signup: $response');

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

  //login
  @override
  Future<Either<Failures, Map<String, dynamic>>> login({
    required String email,
    required String password,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.post(
        endPoint: 'user/login',
        data: {'email': email, 'password': password},

        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      print('Response from login: $response');

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

  //Request for set user role (student or company)
  @override
  Future<Either<Failures, Map<String, dynamic>>> role({
    required String role,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.post(
        endPoint: 'role/set?',
        //data: role,
        data: {"role": role},
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      print('Response : $response');
      print(role);

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

  //Signup for company account
  @override
  Future<Either<Failures, Map<String, dynamic>>> company({
    required CompanyModel companyModel,
  }) async {
    try {
      final file = companyModel.image;

      FormData formData = FormData.fromMap({
        'company_name': companyModel.firstName,

        if (file != null)
          'profile_image': await MultipartFile.fromFile(
            file.path,
            filename: file.path.split('/').last,
          ),
      });
      Map<String, dynamic> response = await apiService.post(
        endPoint: 'company/register?',
        data: formData,

        options: Options(
          headers: {
            'Accept': 'application/json',

            // لا تحط Content-Type لأن Dio بيحطو تلقائياً
          },
        ),
      );

      print('Response from login: $response');

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

  //Update bio
  @override
  Future<Either<Failures, List<dynamic>>> bio({required String bio}) async {
    try {
      List<dynamic> response = await apiService.put(
        endPoint: 'student/bio/update',

        data: {"bio": bio},
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      print('Response : $response');

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

  //Update profile image
  @override
  Future<Either<Failures, Map<String, dynamic>>> profileImage({
    required File image,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        'profile_image': await MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
        ),
      });
      Map<String, dynamic> response = await apiService.post(
        endPoint: 'student/prfile-photo/update',

        //   data: {"profile_image": image},
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      print('Response : $response');

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

  //Add social links
  @override
  Future<Either<Failures, Map<String, dynamic>>> addSocialLinks({
    required List<SocialLinksModel> socialLinksModel,
  }) async {
    try {
      final List<Map<String, dynamic>> links =
          socialLinksModel
              .map(
                (link) => {'id': link.id, 'name': link.name, 'link': link.link},
              )
              .toList();

      Map<String, dynamic> response = await apiService.post(
        endPoint: 'student/social_links/add',

        data: links,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );
      print('Response from add social links: $response');

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

  @override
  Future<Either<Failures, Map<String, dynamic>>> deleteProfilePhoto() async {
    try {
      Map<String, dynamic> response = await apiService.delete(
        endPoint: 'student/profile-image/delete',

        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      print('Response for delete photo: $response');

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
  
  @override
  Future<Either<Failures, Map<String, dynamic>>> getStudentInfo()async {
 try {
      Map<String, dynamic> response = await apiService.get(
        endPoints: 'user/info',

        
      );

      print('Response for get user info : $response');

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
  
  @override
  Future<Either<Failures, Map<String, dynamic>>> postSkills({required Map<String,List<int>> chosenTools})async {
  try {
  Map<String, dynamic> data = {
  "choice_id": chosenTools["choice_id"],  // 👈 Array مباشر
};
      Map<String, dynamic> response = await apiService.post(
        endPoint: 'select_skill',
        data: data,
 options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
        
      );

      print('Response for post skills : $response');

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
  
  @override
  Future<Either<Failures, Map<String, dynamic>>> getSkills()async {
 try {
 
      Map<String, dynamic> response = await apiService.get(
        endPoints: 'user_skill',
 options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
        
      );

      print('Response for get skills : $response');

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
