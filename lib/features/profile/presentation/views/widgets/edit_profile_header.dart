
import 'package:flutter/widgets.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/custom_back_button.dart';
import '../../../../../core/widgets/profile_image.dart';
import 'profile_app_bar.dart';
import '../../../../../generated/l10n.dart';

class EditProfileHeader extends StatelessWidget {
  const EditProfileHeader({
    super.key,
    required this.height,
    required this.lang,
    required this.width,
  });

  final double height;
  final S lang;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}