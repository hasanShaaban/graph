import 'package:flutter/material.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/core/widgets/custom_back_button.dart';
import 'package:graph/core/widgets/profile_image.dart';
import 'package:graph/features/profile/presentation/views/widgets/profile_app_bar.dart';
import 'package:graph/generated/l10n.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            ProfileAppBar(height: height),
            Positioned(
              top: 20,
              left: lang.lang == 'en' ? 20 : null,
              right: lang.lang == 'ar' ? 20 : null,
              child: CustomBackButton(lang: lang),
            ),
            Positioned(
              top: height * 43 / 890,
              child: ProfileImage(
                width: width,
                height: height,
                imageWidth: 170,
                imageHeight: 170,
                borderThick: 5,
                borderColor: Constants2.primaryColor(context),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
