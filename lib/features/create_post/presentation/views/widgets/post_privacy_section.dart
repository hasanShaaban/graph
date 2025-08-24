import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/widgets/custom_drop_down_map.dart';

class PostPrivacySection extends StatefulWidget {
  const PostPrivacySection({
    super.key,
    required this.onChanged,
    required this.privacy,
  });
  final void Function(dynamic)? onChanged;
  final List<Map<String, dynamic>> privacy;

  @override
  State<PostPrivacySection> createState() => _PostPrivacySectionState();
}

class _PostPrivacySectionState extends State<PostPrivacySection> {
  bool showDropdown = false;
  String? selected;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          child: SvgPicture.asset(Assets.iconsDots),
          onTap: () {
            setState(() {
              showDropdown = !showDropdown;
            });
          },
        ),

        if (showDropdown)
          CustomDropDownMap(
            list: widget.privacy,
            text: '',
            onChanged: widget.onChanged!,

            width: 30,
            height: 20,
            border: 0,
          ),
      ],
    );
  }
}
