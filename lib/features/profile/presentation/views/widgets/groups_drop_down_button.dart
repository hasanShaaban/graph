import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graph/features/groups/domain/entity/project_entity.dart';
import 'package:graph/features/groups/presentation/manager/group_info_cubit/group_info_cubit.dart';
import 'package:graph/features/groups/presentation/manager/project_cubit/project_cubit.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/constants.dart';

class GroupsDropDownButton extends StatefulWidget {
  const GroupsDropDownButton({super.key});

  @override
  State<GroupsDropDownButton> createState() => _GroupsDropDownButtonState();
}

class _GroupsDropDownButtonState extends State<GroupsDropDownButton> {
  String selected = 'Projects';
  final GlobalKey _key = GlobalKey();
  double _width = 70;

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
    return BlocBuilder<ProjectCubit, ProjectState>(
      builder: (context, state) {
        if (state is ProjectSuccess) {
          context.read<GroupInfoCubit>().getGroupInfo(projectId: state.response[0].id);
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
                    onTap: () => _showMenu(context, state.response),
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
        } else if (state is ProjectError) {
          return Text(
            state.errorMessage,
            style: AppTextStyle.cairoSemiBold14.copyWith(
              color: Constants2.darkPrimaryColor(context),
            ),
          );
        } else {
          return Shimmer.fromColors(
            baseColor: Constants2.lightSecondaryColor(context),
            highlightColor: Constants2.dividerColor(context),
            child: Container(
              height: 25,
              width: _width,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Constants2.primaryColor(context),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          );
        }
      },
    );
  }

  void _showMenu(BuildContext context, List<ProjectEntity> projects) async {
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
              value: e.name,
              child: Text(
                e.name,
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
