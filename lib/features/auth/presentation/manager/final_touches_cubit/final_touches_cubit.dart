import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:graph/features/auth/data/models/social_links_model.dart';

import '../../../../../core/errors/failures.dart';
import '../../../domain/repos/auth_repo.dart';

part 'final_touches_state.dart';

class FinalTouchesCubit extends Cubit<FinalTouchesState> {
  FinalTouchesCubit(this.authRepo) : super(FinalTouchesInitial());
  final AuthRepo authRepo;
  
  final facebookController = TextEditingController();
  final instagramController = TextEditingController();
  final githubController = TextEditingController();
  final linkedinController = TextEditingController();
  Future<void> finalTouches({String? bio, File? image,}) async {
    emit(FinalTouchesLoading());


   


    final futures = <Future<Either<Failures, dynamic>>>[];

    if (bio != null) {
      futures.add(authRepo.bio(bio: bio));
    }
    if (image != null) {
      futures.add(authRepo.profileImage(image: image));
    }
    final List<SocialLinksModel> socialLinksList = [
      if (facebookController.text.isNotEmpty)
        SocialLinksModel(id: 1, name: "facebook", link: facebookController.text),
      if (instagramController.text.isNotEmpty)
        SocialLinksModel(id: 2, name: "instagram", link: instagramController.text),
      if (githubController.text.isNotEmpty)
        SocialLinksModel(id: 3, name: "github", link: githubController.text),
      if (linkedinController.text.isNotEmpty)
        SocialLinksModel(id: 4, name: "linkedin", link: linkedinController.text),
    ];
if(socialLinksList.isEmpty){
   futures.add(authRepo.addSocialLinks(socialLinksModel: socialLinksList));
}

    if (futures.isEmpty) {
      emit(
        FinalTouchesSuccess(
          [
 {
          "response": "No changes, profile already up-to-date",
        }
          ]
         ),
      );
    }
    final results = await Future.wait(futures);
    for (var result in results) {
      final failure = result.fold((f) => f, (_) => null);
      if (failure != null) {
        emit(FinalTouchesFailuer(failure.errMessage));
        return;
      }
    }
    emit(FinalTouchesSuccess([{"response": "Profile updated successfully"}]));
  }
}
