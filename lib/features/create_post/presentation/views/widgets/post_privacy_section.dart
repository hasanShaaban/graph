import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/widgets/custom_drop_down_map.dart';

class PostPrivacySection extends StatefulWidget {
  const PostPrivacySection({super.key});

  @override
  State<PostPrivacySection> createState() => _PostPrivacySectionState();
}

class _PostPrivacySectionState extends State<PostPrivacySection> {
  final privacy = [
    {'label': 'public', 'icon': Assets.iconsEarthAfrica},
    {'label': 'friends', 'icon': Assets.iconsUsers},
  ];
  String selectedVal = 'public';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SvgPicture.asset(Assets.iconsDots),
      onTap: () {
        CustomDropDownMap(
          list: privacy,
          text: '',
          onChanged: (value) {
            setState(() {
              selectedVal = value;
            });
          },
          width: 0,
          height: 0,
          border: 0,
        );
      },
    );
  }
}
