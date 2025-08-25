import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/core/utils/years_and_major.dart';
import 'package:graph/features/groups/presentation/manager/project_cubit/project_cubit.dart';
import 'package:provider/provider.dart';

class CustomDropDownButton extends StatefulWidget {
  const CustomDropDownButton({
    super.key,
    required this.height,
    required this.text,
    required this.list,
  });
  final String text;
  final double height;
  final List<String> list;

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  String? selected;
  final GlobalKey _key = GlobalKey();
 

  @override
  Widget build(BuildContext context) {
    selected ??= widget.text;
    return Expanded(
      child: GestureDetector(
        onTap: () => _showMenu(context, widget.list),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        selected!,
                        key: _key,
                        style: AppTextStyle.cairoRegular12.copyWith(
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: false,
                      ),
                    ),
                    SizedBox(width: 5),
                    SvgPicture.asset(Assets.iconsDrobeDownArrow, width: 12),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showMenu(BuildContext context, List<String> list) async {
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
          list.map((e) {
            return PopupMenuItem<String>(
              onTap: () {
                context.read<ProjectCubit>().getProjects(yearId: Year.yearbyName[e]!);
              },
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

