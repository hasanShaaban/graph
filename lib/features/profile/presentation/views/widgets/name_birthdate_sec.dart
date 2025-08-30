import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../domain/entity/profile_entity.dart';
import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/app_text_style.dart';

class NameBirthdateSec extends StatelessWidget {
  const NameBirthdateSec({super.key, required this.profileEntity});
  final ProfileEntity profileEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${profileEntity.name} ', style: AppTextStyle.cairoBold22),
            SvgPicture.asset(Assets.iconsLock),
          ],
        ),
        Align(
          alignment: Alignment.center,
          child: Text(profileEntity.birthDate ?? 'No birth date'),
        ),
      ],
    );
  }
}
