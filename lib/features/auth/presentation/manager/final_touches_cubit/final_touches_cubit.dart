import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../data/models/social_links_model.dart';

import '../../../domain/repos/auth_repo.dart';

part 'final_touches_state.dart';

class FinalTouchesCubit extends Cubit<FinalTouchesState> {
  FinalTouchesCubit(this.authRepo) : super(FinalTouchesInitial());
  final AuthRepo authRepo;

  final facebookController = TextEditingController();
  final instagramController = TextEditingController();
  final githubController = TextEditingController();
  final linkedinController = TextEditingController();
  Future<void> finalTouches({
    String? bio,
    File? image,
    Map<String, List<int>>? chosenTools,
  }) async {
    emit(FinalTouchesLoading());
    log("🚀 Starting finalTouches...", name: "FinalTouchesCubit");

    final List<String> errors = [];
    final List<String> successes = [];

    // 1️⃣ تحديث البايو
    if (bio != null && bio.isNotEmpty) {
      final result = await authRepo.bio(bio: bio);
      result.fold(
        (failure) => errors.add("Bio failed: ${failure.errMessage}"),
        (data) => successes.add("Bio updated"),
      );
    }

    // 2️⃣ رفع الصورة
    if (image != null) {
      final result = await authRepo.profileImage(image: image);
      result.fold(
        (failure) => errors.add("Profile image failed: ${failure.errMessage}"),
        (data) => successes.add("Profile image updated"),
      );
    }

    // 3️⃣ روابط التواصل
    final List<SocialLinksModel> socialLinksList = [
      if (facebookController.text.isNotEmpty)
        SocialLinksModel(
          id: 1,
          name: "facebook",
          link: facebookController.text,
        ),
      if (instagramController.text.isNotEmpty)
        SocialLinksModel(
          id: 2,
          name: "instagram",
          link: instagramController.text,
        ),
      if (githubController.text.isNotEmpty)
        SocialLinksModel(id: 3, name: "github", link: githubController.text),
      if (linkedinController.text.isNotEmpty)
        SocialLinksModel(
          id: 4,
          name: "linkedin",
          link: linkedinController.text,
        ),
    ];

    if (socialLinksList.isNotEmpty) {
      final result = await authRepo.addSocialLinks(
        socialLinksModel: socialLinksList,
      );
      result.fold(
        (failure) {
          errors.add("Social links failed: ${failure.errMessage}");
          log("❌ Social links request failed: ${failure.errMessage}");
        },

        (data) {
          successes.add("Social links updated");
          log("✅ Social links response: $data");
        },
      );
    }

    // 4️⃣ المهارات
    if (chosenTools != null &&
        chosenTools["choice_id"] != null &&
        chosenTools["choice_id"]!.isNotEmpty) {
      final result = await authRepo.postSkills(chosenTools: chosenTools);
      result.fold(
        (failure) => errors.add("Skills failed: ${failure.errMessage}"),
        (data) => successes.add("Skills updated"),
      );
    }

    // ✅ النتيجة النهائية
    if (errors.isNotEmpty) {
      emit(FinalTouchesFailuer(errors.join("\n")));
    } else {
      emit(
        FinalTouchesSuccess([
          {"response": "All updates done successfully"},
        ]),
      );
    }

    log(
      "🎉 FinalTouches finished. Successes: $successes, Errors: $errors",
      name: "FinalTouchesCubit",
    );
  }

  // Future<void> finalTouches({
  //   String? bio,
  //   File? image,
  //   Map<String, List<int>>? chosenTools,
  // }) async {
  //   emit(FinalTouchesLoading());
  //   log("🚀 Starting finalTouches...", name: "FinalTouchesCubit");
  //   final futures = <Future<Either<Failures, dynamic>>>[];

  //   if (bio != null) {
  //     futures.add(authRepo.bio(bio: bio));
  //     final bioResult = await authRepo.bio(bio: bio);
  //     bioResult.fold(
  //       (failure) => log("❌ Bio request failed: ${failure.errMessage}"),
  //       (data) => log("✅ Bio request success: $data"),
  //     );
  //   }
  //   if (image != null) {
  //     futures.add(authRepo.profileImage(image: image));
  //     log("📌 Profile Image request added", name: "FinalTouchesCubit");
  //   }
  //   final List<SocialLinksModel> socialLinksList = [
  //     if (facebookController.text.isNotEmpty)
  //       SocialLinksModel(
  //         id: 1,
  //         name: "facebook",
  //         link: facebookController.text,
  //       ),
  //     if (instagramController.text.isNotEmpty)
  //       SocialLinksModel(
  //         id: 2,
  //         name: "instagram",
  //         link: instagramController.text,
  //       ),
  //     if (githubController.text.isNotEmpty)
  //       SocialLinksModel(id: 3, name: "github", link: githubController.text),
  //     if (linkedinController.text.isNotEmpty)
  //       SocialLinksModel(
  //         id: 4,
  //         name: "linkedin",
  //         link: linkedinController.text,
  //       ),
  //   ];
  //   if (socialLinksList.isNotEmpty) {
  //     futures.add(authRepo.addSocialLinks(socialLinksModel: socialLinksList));
  //     log("📌 Social Links request added", name: "FinalTouchesCubit");
  //   }
  //   if (chosenTools != null &&
  //       chosenTools.isNotEmpty &&
  //       chosenTools["choice_id"] != null &&
  //       chosenTools["choice_id"]!.isNotEmpty) {
  //     futures.add(authRepo.postSkills(chosenTools: chosenTools));
  //     log("📌 Chosen Tools request added", name: "FinalTouchesCubit");
  //   }

  //   log("🚀 عدد الـ requests = ${futures.length}", name: "FinalTouchesCubit");

  //   if (futures.isEmpty) {
  //     log("⚠️ No changes to send", name: "FinalTouchesCubit");
  //     emit(
  //       FinalTouchesSuccess([
  //         {"response": "No changes, profile already up-to-date"},
  //       ]),
  //     );
  //   }

  //   final results = await Future.wait(futures);

  //   for (var i = 0; i < results.length; i++) {
  //     final result = results[i];
  //     bool hasError = false;
  //     result.fold(
  //       (failure) {
  //         hasError = true;
  //         log(
  //           "❌ Request #$i failed: ${failure.errMessage}",
  //           name: "FinalTouchesCubit",
  //         );
  //       },
  //       (data) {
  //         // لو data هي Map فيها "error" أو List فيها Map فيها "error"
  //         bool errorFound = false;
  //         if (data is Map && data.containsKey('error')) errorFound = true;
  //         if (data is List) {
  //           for (var item in data) {
  //             if (item is Map && item.containsKey('error')) errorFound = true;
  //           }
  //         }

  //         if (errorFound) {
  //           hasError = true;
  //           log(
  //             "⚠️ Request #$i has error in response: ${data.toString()}",
  //             name: "FinalTouchesCubit",
  //           );
  //         }
  //       },
  //     );

  //     if (hasError) {
  //       emit(
  //         FinalTouchesFailuer(
  //           "Request #$i failed: ${results[i].fold((f) => f.errMessage, (d) => d.toString())}",
  //         ),
  //       );
  //       return; // توقف العملية
  //     }
  //   }

  //   // إذا ما في errors
  //   emit(
  //     FinalTouchesSuccess([
  //       {"response": "Profile updated successfully"},
  //     ]),
  //   );
  //   log("🎉 All requests done successfully", name: "FinalTouchesCubit");
  // }
}
