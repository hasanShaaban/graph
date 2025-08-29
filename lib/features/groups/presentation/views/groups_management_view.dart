import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/appAssets.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/utils/constants.dart';
import '../../../auth/presentation/views/widgets/tech_tools_grid_view.dart';
import '../../../auth/presentation/views/widgets/tech_tools_icon_add.dart';
import 'widget/groups_managment_body.dart';
import 'widget/list_view_item.dart';

class GroupsManagementView extends StatelessWidget {
  const GroupsManagementView({super.key});
  static const name = 'groupsManagement';

  @override
  Widget build(BuildContext context) {
    // final lang = S.of(context);
    return SafeArea(
      child: Scaffold(
        // appBar: CustomAppBar(text1: lang.groupsManagement, onPressed: () {}),
        body: GroupsManagementBody(),
      ),
    );
  }
}

class GroupsManagementContainer extends StatefulWidget {
  const GroupsManagementContainer({super.key});

  @override
  State<GroupsManagementContainer> createState() =>
      _GroupsManagementContainerState();
}

class _GroupsManagementContainerState extends State<GroupsManagementContainer> {
  List<int> selectedItems = [];

  List<String> icons = ['mobile developer', 'UI-Ux', 'laravel', 'react'];

  List<String> icons2 = [
    Assets.iconsFacebook,
    Assets.iconsEarthAfrica,
    Assets.iconsEye,
    Assets.iconsCakeBirthday,
    Assets.iconsInstagram,
    Assets.iconsGithub,
    Assets.iconsLinkedin,
    Assets.iconsEnvelope,
    Assets.iconsGraduationCap,
  ];
  //List<String> selectedTools = [];
  List<int> selectedItems2 = [];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            color: Constants2.lightSecondaryColor(context),
          ),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('group member 1', style: AppTextStyle.cairoRegular14),
                    Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.red),
                      ),
                      child: Icon(Icons.minimize, size: 10, color: Colors.red),
                    ),
                  ],
                ),
                Row(
                  children: [
                    CustomCircleContainer(),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Saly Karem', style: AppTextStyle.cairoSemiBold18),
                        Text(
                          '4th year - Software Engineering',
                          style: AppTextStyle.cairoRegular14,
                        ),
                      ],
                    ),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Role:'),

                    Wrap(
                      children: [
                        ...selectedItems.map((index) {
                          return Padding(
                            padding: const EdgeInsets.all(5),
                            child: GestureDetector(
                              onLongPress: () {
                                setState(() {
                                  selectedItems.remove(index);
                                });
                              },
                              child: Container(
                                width:
                                    MediaQuery.sizeOf(context).width *
                                    250 /
                                    412,
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13),
                                  color: Constants2.primaryColor(context),
                                ),
                                child: Center(child: Text(icons[index])),
                              ),
                            ),
                          );
                        }),

                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: GestureDetector(
                            onTap: () async {
                              final selectedItem =
                                  await showModalBottomSheet<int>(
                                    context: context,
                                    builder:
                                        (context) => Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: TechToolsGridView(
                                            items: [
                                              'mobile developer',
                                              'UI-Ux',
                                              'laravel',
                                              'react',
                                            ],
                                            itemBuilder:
                                                (String item, int index) =>
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                            8.0,
                                                          ),
                                                      child: Text(item),
                                                    ),
                                          ),
                                        ),
                                  );
                              if (selectedItem != null) {
                                setState(() {
                                  if (!selectedItems.contains(selectedItem)) {
                                    selectedItems.add(selectedItem);
                                  }
                                });
                              }
                            },
                            child: SvgPicture.asset(
                              Assets.iconsAdd,
                              color: Constants2.darkSecondaryColor(context),
                              fit: BoxFit.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text('Tools:', style: AppTextStyle.cairoRegular16),
                    Wrap(
                      children: [
                        ...selectedItems2.map((index) {
                          return Padding(
                            padding: const EdgeInsets.all(5),
                            child: GestureDetector(
                              onLongPress: () {
                                setState(() {
                                  selectedItems2.remove(index);
                                });
                              },
                              child: Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: Constants2.dividerColor(context),
                                ),
                                child: SvgPicture.asset(
                                  icons2[index],
                                  fit: BoxFit.none,
                                ),
                              ),
                            ),
                          );
                        }),

                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: GestureDetector(
                            onTap: () async {
                              final selectedItem =
                                  await showModalBottomSheet<int>(
                                    context: context,
                                    builder:
                                        (context) => Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: TechToolsGridView(
                                            items: [
                                              Assets.iconsFacebook,
                                              Assets.iconsEarthAfrica,
                                              Assets.iconsEye,
                                              Assets.iconsCakeBirthday,
                                              Assets.iconsInstagram,
                                              Assets.iconsGithub,
                                              Assets.iconsLinkedin,
                                              Assets.iconsEnvelope,
                                              Assets.iconsGraduationCap,
                                            ],
                                            itemBuilder:
                                                (String item, int index) =>
                                                    SvgPicture.asset(
                                                      item,
                                                      width: 44,
                                                      height: 44,
                                                      fit: BoxFit.none,
                                                    ),
                                          ),
                                        ),
                                  );
                              if (selectedItem != null) {
                                setState(() {
                                  if (!selectedItems2.contains(selectedItem)) {
                                    selectedItems2.add(selectedItem);
                                  }
                                });
                              }
                            },
                            child: TechToolsIconAdd(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
