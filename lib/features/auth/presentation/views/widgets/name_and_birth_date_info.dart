import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../data/models/signup_data_model.dart';
import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/app_text_style.dart';

class NameAndBirthDateInfo extends StatelessWidget {
  const NameAndBirthDateInfo({super.key, required this.signupDataModel});
  final SignupDataModel signupDataModel;
  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${signupDataModel.firstName!} ${signupDataModel.lastName}',
              style: AppTextStyle.cairoBold22,
            ),
            SvgPicture.asset(Assets.iconsLock),
          ],
        ),
        Align(
          alignment: Alignment.center,
          child: Text(signupDataModel.birthDate!),
        ),
      ],
    );
  }
}
