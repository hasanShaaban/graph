import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/features/groups/presentation/views/widget/add_button.dart';
import 'package:graph/features/groups/presentation/views/widget/role_text_field.dart';
import 'package:graph/generated/l10n.dart';

class GroupMemberRole extends StatefulWidget {
  const GroupMemberRole({
    super.key,
    required this.lang,
    required this.width,
    required this.height,
  });
  final S lang;
  final double width;
  final double height;

  @override
  State<GroupMemberRole> createState() => _GroupMemberRoleState();
}

class _GroupMemberRoleState extends State<GroupMemberRole> {
  List<TextEditingController> controllers = [TextEditingController()];
  List<String> roles = [];

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.lang.role,
          style: AppTextStyle.cairoRegular16.copyWith(
            color: Constants2.darkSecondaryColor(context),
          ),
        ),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...List.generate(
              controllers.length,
              (index) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      RoleTextField(
                        onSubmitted: (value) {
                          roles.add(value);
                        },
                        width: widget.width,
                        lang: widget.lang,
                        controller: controllers[index], // Assign unique key
                      ),
                      controllers.length > 1
                          ? Positioned(
                            top: -5,
                            right: widget.lang.lang == 'ar' ? null : -5,
                            left: widget.lang.lang == 'en' ? null : -5,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  final removedController = controllers
                                      .removeAt(index);
                                  removedController.dispose();
                                  if (roles.isNotEmpty &&
                                      index <= roles.length) {
                                    roles.removeAt(index);
                                  }
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: Constants2.lightSecondaryColor(
                                    context,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: SvgPicture.asset(Assets.iconsRemove),
                              ),
                            ),
                          )
                          : SizedBox(),
                    ],
                  ),
                  index == controllers.length - 1
                      ? AddButton(
                        onTap: () {
                          if (controllers.length < 4) {
                            setState(() {
                              controllers.add(TextEditingController());
                            });
                          }
                        },
                      )
                      : SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
