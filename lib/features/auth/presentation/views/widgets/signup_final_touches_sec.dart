import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph/core/functions/show_tools_bottom_sheet.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/features/auth/data/models/signup_data_model.dart';
import 'package:graph/features/auth/presentation/manager/get_skills_cubit/get_skills_cubit.dart';
import 'package:graph/features/create_post/presentation/views/creat_post_page.dart';
import 'package:graph/features/groups/presentation/views/widget/add_button.dart';
import 'package:graph/features/groups/presentation/views/widget/group_member_tools_list_view.dart';
import '../../manager/final_touches_cubit/final_touches_cubit.dart';
import 'name_and_birth_date_info.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/utils/appAssets.dart';
import 'custom_text_cairo16_semi_bold.dart';
import 'cv_row.dart';
import 'final_touches_bio_sec.dart';
import 'final_touches_study_spacialization_sec.dart';
import 'final_touches_top_sec.dart';
import 'next_button.dart';
import 'social_links_row.dart';
import '../../../../../generated/l10n.dart';

class SignupFinalTouchesSec extends StatefulWidget {
  const SignupFinalTouchesSec({super.key, required this.signupData});
  final SignupDataModel signupData;
  static const name = 'finalTouches';

  @override
  State<SignupFinalTouchesSec> createState() => _SignupFinalTouchesSecState();
}

class _SignupFinalTouchesSecState extends State<SignupFinalTouchesSec> {
  List<String> icons = [
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
  List<String> selectedTools = [];
  List<int> selectedItems = [];

  String? bioText;

  File? profileImage;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null && mounted) {
      setState(() {
        profileImage = File(picked.path);
      });
    }
  }

  void deleteImage() {
    setState(() => profileImage = null);
  }

  List<String> chosenTools = [];
  @override
  void initState() {
    super.initState();
    context.read<GetSkillsCubit>().getSkills();
  }

  @override
  Widget build(BuildContext context) {
    String? gender = widget.signupData.gender;
    double width = MediaQuery.of(context).size.width;

    print(gender);
    final cubit = context.read<FinalTouchesCubit>();
    final lang = S.of(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FinalTouchesTopSection(
                  lang: lang,
                  image: profileImage,
                  onEditTap: pickImage,
                  onDelete: deleteImage,

                  gender: gender!,
                ),
                NameAndBirthDateInfo(signupDataModel: widget.signupData),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          FinalTouchesStudySpacializationSec(
                            text1: 'study level: ',
                            text2: '${widget.signupData.studyYearName!} year',
                          ),
                          SizedBox(height: 7),
                          widget.signupData.studyYearName == 'fourth' ||
                                  widget.signupData.studyYearName == 'fifth'
                              ? FinalTouchesStudySpacializationSec(
                                text1: 'spacializtion: ',
                                text2:
                                    widget.signupData.specializationName ?? '',
                              )
                              : SizedBox(height: 30),
                        ],
                      ),

                      FinalTouchesBioSec(
                        onBioChanged: (value) {
                          bioText = value;
                        },
                      ),
                      SizedBox(height: 13),

                      // Text(lang.techTools, style: AppTextStyle.cairoSemiBold16),
                      // chosenTools.isNotEmpty
                      //     ? Row(
                      //       mainAxisAlignment: MainAxisAlignment.start,
                      //       children: [
                      //         GroupMemberToolsListView(
                      //           lang: lang,
                      //           chosenTools: chosenTools,
                      //           width: width,
                      //         ),
                      //         AddButton(
                      //           onTap: () async {
                      //             final result = await showToolsBottomSheet(
                      //               context: context,
                      //               initialChosenTools: chosenTools,
                      //               lang: lang,
                      //               tools: tools,
                      //             );
                      //             setState(() {
                      //               chosenTools = result;
                      //             });
                      //           },
                      //         ),
                      //       ],
                      //     )
                      //     : AddButton(
                      //       onTap: () async {
                      //         final result = await showToolsBottomSheet(
                      //           context: context,
                      //           initialChosenTools: chosenTools,
                      //           lang: lang,
                      //           tools: tools,
                      //         );
                      //         setState(() {
                      //           chosenTools = result;
                      //         });
                      //       },
                      //     ),
                      Text(lang.techTools, style: AppTextStyle.cairoSemiBold16),
                      BlocConsumer<GetSkillsCubit, GetSkillsState>(
                        listener: (context, state) {
                          if (state is GetSkillsFailuer) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Error: ${state.errorMessage}"),
                              ),
                            );
                          }
                        },
                        builder: (context, state) {
                          if (state is GetSkillsLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is GetSkillsSuccess) {
                            final skillsList = List<Map<String, dynamic>>.from(
                              state.response,
                            );
                            final skillIcons =
                                skillsList
                                    .where(
                                      (e) =>
                                          e['logo_url'] != null &&
                                          e['logo_url'].toString().isNotEmpty,
                                    )
                                    .map(
                                      (e) =>
                                          'http://127.0.0.1:8000/storage/${e['logo_url']}',
                                    )
                                    .toList();
                            final toolIds = {
                              for (var skill in skillsList)
                                'http://127.0.0.1:8000/storage/${skill['logo_url']}':
                                    skill['id'],
                            };

                            return chosenTools.isNotEmpty
                                ? Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    GroupMemberToolsListView(
                                      lang: lang,
                                      chosenTools: chosenTools,
                                      width: width,
                                    ),
                                    AddButton(
                                      onTap: () async {
                                        final result =
                                            await showToolsBottomSheet(
                                              context: context,
                                              initialChosenTools: chosenTools,
                                              lang: lang,
                                              // مرق skills بدل tools الثابتة
                                              tools: skillIcons,
                                            );
                                        setState(() {
                                          chosenTools = result;
                                        });
                                      },
                                    ),
                                  ],
                                )
                                : AddButton(
                                  onTap: () async {
                                    final result = await showToolsBottomSheet(
                                      context: context,
                                      initialChosenTools: chosenTools,
                                      lang: lang,
                                      tools: skillIcons,
                                    );
                                    setState(() {
                                      chosenTools = result;
                                    });
                                  },
                                );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),

                      CustomTextCairo16SemiBold(text: 'Social links'),

                      SocialLinksRow(
                        controller: cubit.facebookController,
                        icon: Assets.iconsFacebook,
                      ),
                      SocialLinksRow(
                        controller: cubit.githubController,
                        icon: Assets.iconsGithub,
                      ),
                      SocialLinksRow(
                        controller: cubit.instagramController,
                        icon: Assets.iconsInstagram,
                      ),
                      SocialLinksRow(
                        controller: cubit.linkedinController,
                        icon: Assets.iconsLinkedin,
                      ),
                      SizedBox(height: 20),
                      CVRow(),
                      SizedBox(height: 20),

                      BlocConsumer<FinalTouchesCubit, FinalTouchesState>(
                        listener: (context, state) async {
                          if (state is FinalTouchesSuccess) {
                            Navigator.pushNamed(context, CreatPostPage.name);
                          } else if (state is FinalTouchesFailuer) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.errorMessage)),
                            );
                          }
                        },
                        builder: (context, state) {
                          return NextButton(
                            title: lang.Save,
                            isLoading: state is FinalTouchesLoading,

                            onPressed: () {
                              // final selectedIds =
                              //     chosenTools
                              //         .map((tool) => toolIds[tool]!)
                              //         .toList();
                              final skillsList =
                                  context.read<GetSkillsCubit>().state
                                          is GetSkillsSuccess
                                      ? List<Map<String, dynamic>>.from(
                                        (context.read<GetSkillsCubit>().state
                                                as GetSkillsSuccess)
                                            .response,
                                      )
                                      : [];
                              final toolIds = {
                                for (var skill in skillsList)
                                  'http://127.0.0.1:8000/storage/${skill['logo_url']}':
                                      skill['id'],
                              };

                              final selectedIds =
                                  chosenTools
                                      .map<int>((tool) => toolIds[tool]!)
                                      .toList();

                              context.read<FinalTouchesCubit>().finalTouches(
                                bio: bioText,
                                image: profileImage,
                                chosenTools: {"choice_id": selectedIds},
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
