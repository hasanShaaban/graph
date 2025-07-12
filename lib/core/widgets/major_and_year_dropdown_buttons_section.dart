import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';

class MajorAndYearDropdownButtonsSection extends StatelessWidget {
  const MajorAndYearDropdownButtonsSection({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomDropDownButton(height: height),
        SizedBox(width: 10),
        CustomDropDownButton(height: height),
      ],
    );
  }
}

class CustomDropDownButton extends StatefulWidget {
  const CustomDropDownButton({super.key, required this.height});
  final double height;

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  String selected = projects[1];
  final GlobalKey _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: widget.height * 40 / 915,

        padding: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: Constants2.primaryColor(context),
        ),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => _showMenu(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        selected,
                        key: _key,
                        style: AppTextStyle.cairoRegular12.copyWith(
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: false,
                      ),
                    ),
                    SvgPicture.asset(Assets.iconsDrobeDownArrow, width: 12),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showMenu(BuildContext context) async {
    final RenderBox box = context.findRenderObject() as RenderBox;
    final Offset position = box.localToGlobal(Offset.zero);

    final result = await showMenu<String>(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      context: context,
      elevation: 4,
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy + box.size.height,
        position.dx + box.size.width,
        0,
      ),
      items:
          projects.map((e) {
            return PopupMenuItem<String>(
              value: e,
              child: Text(
                e,
                style: AppTextStyle.cairoRegular12.copyWith(
                  color: Colors.black,
                ),
              ),
            );
          }).toList(),
      color: Constants2.lightSecondaryColor(context),
    );
    if (result != null && result != selected) {
      setState(() {
        selected = result;
      });
    }
  }
}

List<String> projects = [
  'Algorithms and data structures hjfk jh kjdhf kj',
  'project 1',
  'data base 1',
  'project 2',
  'data base 2',
  'project 3',
  'data base 3',
];
