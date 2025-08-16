import 'package:flutter/material.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/widgets/custom_drop_down_map.dart';
import 'package:graph/core/widgets/custom_stateless_appbar.dart';
import 'package:graph/core/widgets/profile_image.dart';
import 'package:graph/features/profile/presentation/views/widgets/creat_post_bottom_buttons.dart';
import 'package:graph/features/profile/presentation/views/widgets/post_button.dart';
import 'package:graph/features/profile/presentation/views/widgets/post_privacy_section.dart';
import 'package:graph/features/profile/presentation/views/widgets/project_post_body_sec.dart';
import 'package:graph/features/profile/presentation/views/widgets/public_post_body_sec.dart';
import 'package:graph/generated/l10n.dart';
import 'package:graph/features/profile/data/models/person_model.dart';

class CreatPostPage extends StatefulWidget {
  const CreatPostPage({super.key});
  static const name = 'createPost';
  @override
  State<CreatPostPage> createState() => _CreatPostPageState();
}

class _CreatPostPageState extends State<CreatPostPage> {
  final list = [
    {'label': 'project', 'icon': Assets.iconsPollH},
    {'label': 'normal', 'icon': Assets.iconsEmployeeMan},
  ];
  final subjectList = [
    {'label': 'public', 'icon': Assets.iconsEarthAfrica},
    {'label': 'friends', 'icon': Assets.iconsUsers},
    {'label': 'project', 'icon': Assets.iconsPollH},
    {'label': 'group', 'icon': Assets.iconsCoworking},
    {'label': 'job', 'icon': Assets.iconsEmployeeMan},
  ];
  String selectedVal = 'public';
  String selectedSubject = 'Subject';

  final Set<Person> selectedMentions = {};

  void addMention(Person p) {
    setState(() => selectedMentions.add(p));
  }

  void removeMention(Person p) {
    setState(() => selectedMentions.removeWhere((e) => e.id == p.id));
  }

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Column(
          children: [
            CustomStatelessAppbar(lang: lang, title: lang.createPost),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ProfileImage(
                            width: width,
                            height: height,
                            imageWidth: 55,
                            imageHeight: 55,
                            borderThick: 1,
                          ),
                          SizedBox(width: 17),
                          Column(
                            children: [
                              Text(
                                'Ahmad Ali',
                                style: AppTextStyle.cairoSemiBold18,
                              ),
                              Row(
                                children: [
                                  CustomDropDownMap(
                                    list: list,
                                    text: selectedVal,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedVal = value;
                                      });
                                    },
                                    width: width * 87 / 412,
                                    height: 27,
                                    border: 7,
                                  ),
                                  SizedBox(width: 7),
                                  selectedVal == 'project'
                                      ? CustomDropDownMap(
                                        list: subjectList,
                                        text: selectedSubject,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedSubject = value;
                                          });
                                        },
                                        width: width * 87 / 412,
                                        height: 27,
                                        border: 7,
                                      )
                                      : SizedBox(),
                                ],
                              ),
                            ],
                          ),
                          Spacer(),
                          PostButton(),
                          SizedBox(width: 10),
                          PostPrivacySection(),
                        ],
                      ),
                      SizedBox(height: 20),

                      selectedVal == 'project'
                          ? ProjectPostBodySec()
                          : PublicPostBodySec(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),

        bottomSheet:
            _isKeyboardVisible(context)
                ? Padding(
                  padding: const EdgeInsets.all(20),
                  child: CreatPostBottomButtons(
                    selectedVal: selectedVal,
                    selectedPersons: selectedMentions,
                    onAddPerson: addMention,
                    onRemovePerson: removeMention,
                  ),
                )
                : null,
      ),
    );
  }

  bool _isKeyboardVisible(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom > 0;
  }
}
