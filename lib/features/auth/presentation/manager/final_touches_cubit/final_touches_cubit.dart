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
    File? cv,
    int? yearId,
    int? majorId,
    Map<String, List<int>>? chosenTools,
    required List<Map<String, String>> socialLinks,
  }) async {
    emit(FinalTouchesLoading());
    log(" Starting finalTouches...", name: "FinalTouchesCubit");

    final List<String> errors = [];
    final List<String> successes = [];

    //Bio
    log(" BIO: ${bio ?? 'null'}");
    if (bio != null && bio.isNotEmpty) {
      final result = await authRepo.bio(bio: bio);
      result.fold(
        (failure) => errors.add("Bio failed: ${failure.errMessage}"),
        (data) => successes.add("Bio updated"),
      );
    }

    // Image
    if (image != null) {
      final result = await authRepo.profileImage(image: image);
      result.fold(
        (failure) => errors.add("Profile image failed: ${failure.errMessage}"),
        (data) => successes.add("Profile image updated"),
      );
    }

    // Social links
    log(" SOCIAL LINKS: ${socialLinks.map((e) => e.toString()).toList()}");
    if (socialLinks.isNotEmpty) {
      final socialLinksList =
          socialLinks.map((link) {
            return SocialLinksModel(
              id: 0, // أو id حسب الباك (ممكن تخليه null لو السيرفر يولد)
              name: link["name"]!,
              link: link["link"]!,
            );
          }).toList();

      final result = await authRepo.addSocialLinks(
        socialLinksModel: socialLinksList,
      );
      result.fold(
        (failure) {
          errors.add("Social links failed: ${failure.errMessage}");
          log(" Social links request failed: ${failure.errMessage}");
        },
        (data) {
          successes.add("Social links updated");
          log("Social links response: $data");
        },
      );
    }

    // Skills
    if (chosenTools != null &&
        chosenTools["choice_id"] != null &&
        chosenTools["choice_id"]!.isNotEmpty) {
      final result = await authRepo.postSkills(chosenTools: chosenTools);
      result.fold(
        (failure) => errors.add("Skills failed: ${failure.errMessage}"),
        (data) => successes.add("Skills updated"),
      );
    }
    // CV
    if (cv != null) {
      final result = await authRepo.postCV(cv: cv);
      result.fold(
        (failure) {
          errors.add("CV upload failed: ${failure.errMessage}");
          log(" CV request failed: ${failure.errMessage}");
        },
        (data) {
          successes.add("CV uploaded");
          log(" CV response: $data");
        },
      );
    }
    // Update year
    if (yearId != null) {
      log(" Updating year with ID: $yearId", name: "FinalTouchesCubit");
      final result = await authRepo.postUpdateYear(yearId: yearId);
      result.fold(
        (failure) {
          errors.add("Update year failed: ${failure.errMessage}");
          log(
            " Update year failed: ${failure.errMessage}",
            name: "FinalTouchesCubit",
          );
        },
        (data) {
          successes.add("Year updated successfully");
          log(" Year updated successfully: $data", name: "FinalTouchesCubit");
        },
      );
    }

    // Update major
    if (majorId != null) {
      log(" Updating major with ID: $majorId", name: "FinalTouchesCubit");
      final result = await authRepo.postUpdateMajor(majorId: majorId);
      result.fold(
        (failure) {
          errors.add("Update mjor failed: ${failure.errMessage}");
          log(
            " Update mjor failed: ${failure.errMessage}",
            name: "FinalTouchesCubit",
          );
        },
        (data) {
          successes.add("mjor updated successfully");
          log(" mjor updated successfully: $data", name: "FinalTouchesCubit");
        },
      );
    }

    // final result
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
}
