
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/core/services/providers/group_provider.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/features/groups/domain/entity/project_entity.dart';
import 'package:graph/features/groups/presentation/manager/group_info_cubit/group_info_cubit.dart';
import 'package:graph/features/groups/presentation/manager/project_cubit/project_cubit.dart';
import 'package:shimmer/shimmer.dart';

class ProjectDropDownButton extends StatefulWidget {
  const ProjectDropDownButton({
    super.key,
    required this.height,
    required this.text, this.selectedProject,
  });
  final String text;
  final double height;
  final ValueChanged<int>? selectedProject;

  @override
  State<ProjectDropDownButton> createState() => _ProjectDropDownButtonState();
}

class _ProjectDropDownButtonState extends State<ProjectDropDownButton> {
  String? selected;
  final GlobalKey _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    selected ??= widget.text;
    return BlocBuilder<ProjectCubit, ProjectState>(
      builder: (context, state) {
        if (state is ProjectSuccess) {
          selected = state.response[0].name;
          widget.selectedProject?.call(state.response[0].id);
          return Expanded(
            child: GestureDetector(
              onTap: () => _showMenu(context, state.response),
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
                          SvgPicture.asset(
                            Assets.iconsDrobeDownArrow,
                            width: 12,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (state is ProjectError) {
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            'some thing went wrong',
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Expanded(
            child: GestureDetector(
              onTap: () => _showShimmerMenu(context, ['', '', '']),
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
                              style: AppTextStyle.cairoRegular12.copyWith(
                                color: Colors.white,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              softWrap: false,
                            ),
                          ),
                          SizedBox(width: 5),
                          SvgPicture.asset(
                            Assets.iconsDrobeDownArrow,
                            width: 12,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }

  void _showMenu(BuildContext context, List<ProjectEntity> list) async {
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
                context.read<GroupInfoCubit>().getGroupInfo(projectId: e.id);
                context.read<GroupProvider>().setProjectId(e.id);
                widget.selectedProject?.call(e.id);
              },
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
      });
    }
  }

  void _showShimmerMenu(BuildContext context, List<String> list) async {
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
              value: e,
              child: Shimmer.fromColors(
                baseColor: Constants2.lightSecondaryColor(context),
                highlightColor: Constants2.dividerColor(context),
                child: Text(
                  e,
                  style: AppTextStyle.cairoRegular12.copyWith(
                    color: Colors.black,
                  ),
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

