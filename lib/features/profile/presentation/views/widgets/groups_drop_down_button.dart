import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';

class GroupsDropDownButton extends StatefulWidget {
  const GroupsDropDownButton({super.key});

  @override
  State<GroupsDropDownButton> createState() => _GroupsDropDownButtonState();
}

class _GroupsDropDownButtonState extends State<GroupsDropDownButton> {
  String selected = projects[1];
  final GlobalKey _key = GlobalKey();
  double _width = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _updateWidth());
  }

  void _updateWidth() {
    final RenderBox? box =
        _key.currentContext?.findRenderObject() as RenderBox?;
    if (box != null && mounted) {
      setState(() {
        _width = box.size.width + 30;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: _width,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Constants2.primaryColor(context),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => _showMenu(context),
              child: Row(
                children: [
                  Text(
                    selected,
                    key: _key,
                    style: AppTextStyle.cairoRegular12.copyWith(
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  SvgPicture.asset(Assets.iconsDrobeDownArrow, width: 12),
                ],
              ),
            ),
          ),
        ],
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
        WidgetsBinding.instance.addPostFrameCallback((_) => _updateWidth());
      });
    }
  }
}

List<String> projects = [
  'Algorithms and data structures',
  'project 1',
  'data base 1',
  'project 2',
  'data base 2',
  'project 3',
  'data base 3',
];
