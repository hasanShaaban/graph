// import 'package:dio/dio.dart';
// import 'package:graph/features/auth/domain/Entity/user_entity.dart';
// import 'dart:io';

// Future<FormData> userToFormData(UserEntity user) async {
//   return FormData.fromMap({
//     'first_name': user.firstName,
//     'last_name': user.lastName,
//     'birth_date': user.dateOfBirht,
//     'gender': user.gender,
//     'year_id': user.studyYear,
//     'major_id': user.spacialization,
//     'profile_image': user.image != null
//         ? await MultipartFile.fromFile(user.image!.path,
//             filename: user.image!.path.split('/').last)
//         : null,
//   });
// }

import 'package:dio/dio.dart';
import 'package:graph/features/auth/domain/Entity/user_entity.dart';
import 'package:path/path.dart'; 

Future<FormData> userToFormData(UserEntity user) async {
  FormData formData = FormData();


  formData.fields.add(MapEntry('first_name', user.firstName ?? ''));
  formData.fields.add(MapEntry('last_name', user.lastName ?? ''));
  formData.fields.add(MapEntry('birth_date', user.dateOfBirht ?? ''));
  formData.fields.add(MapEntry('gender', user.gender ?? ''));
  formData.fields.add(MapEntry('year_id', user.studyYear?.toString() ?? '0'));
  formData.fields.add(
    MapEntry('major_id', user.spacialization?.toString() ?? '0'),
  );

  // الصورة (إذا موجودة فقط)
  if (user.image != null) {
    formData.files.add(
      MapEntry(
        'profile_image',
        await MultipartFile.fromFile(
          user.image!.path,
          filename: basename(user.image!.path),
        ),
      ),
    );
  }

  return formData;
}
