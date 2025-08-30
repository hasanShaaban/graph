import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph/bloc_providers.dart';
import 'package:graph/features/groups/presentation/manager/project_cubit/project_cubit.dart';
import 'package:graph/features/main/presentation/manager/user_image_cubit/user_image_cubit.dart';
import 'package:graph/features/main/presentation/views/main_page.dart';
import 'package:graph/features/profile/presentation/views/profile_view.dart';
import '../../../../../core/functions/show_tools_bottom_sheet.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../data/models/signup_data_model.dart';
import '../../manager/get_skills_cubit/get_skills_cubit.dart';
import '../../../../groups/presentation/views/widget/add_button.dart';
import '../../../../groups/presentation/views/widget/group_member_tools_list_view.dart';
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

  File? cvFile;
  bool _isInitialized = false;

  late FinalTouchesCubit cubit;
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
    setState(() {
      profileImage = null;
    });
  }

  Future<void> pickCV() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.single.path != null) {
      setState(() {
        cvFile = File(result.files.single.path!);
      });
    }
  }

  List<String> chosenTools = [];
  @override
  void initState() {
    super.initState();
    cubit = context.read<FinalTouchesCubit>();
    context.read<GetSkillsCubit>().getSkills();
  }

  late SignupDataModel signupData;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      final args = ModalRoute.of(context)?.settings.arguments;

      if (args != null && args is SignupDataModel) {
        signupData = args;

        if (profileImage == null) {
          profileImage = signupData.selectedImage;
        }
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pop(context);
        });
      }
      _isInitialized = true;
    }
  }

  final TextEditingController bioController = TextEditingController();

  @override
  void dispose() {
    bioController.dispose();
    super.dispose();
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
        resizeToAvoidBottomInset: true,
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
                        controller: bioController,
                        onBioChanged: (value) {
                          bioText = value;
                        },
                      ),
                      SizedBox(height: 13),

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
                      CVRow(onCVPicked: pickCV),
                      SizedBox(height: 20),

                      BlocConsumer<FinalTouchesCubit, FinalTouchesState>(
                        listener: (context, state) async {
                          if (state is FinalTouchesSuccess) {
                            final year =
                                await profileLocalDataSource.getStudentYear();
                            final major =
                                await profileLocalDataSource.getStudentMajor();
                            context.read<UserImageCubit>().getUserImage();
                            context.read<ProjectCubit>().getProjects(
                              yearId: year == 0 ? 1 : year,
                              majorId: major == 0 ? null : major,
                            );
                            Navigator.pushNamed(
                              context,
                              MainPage.name,
                              arguments: signupData,
                            );
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

                              final socialLinks = [
                                {
                                  "name": "facebook",
                                  "link": cubit.facebookController.text,
                                },
                                {
                                  "name": "github",
                                  "link": cubit.githubController.text,
                                },
                                {
                                  "name": "instagram",
                                  "link": cubit.instagramController.text,
                                },
                                {
                                  "name": "linkedin",
                                  "link": cubit.linkedinController.text,
                                },
                              ];

                              context.read<FinalTouchesCubit>().finalTouches(
                                bio: bioController.text,
                                image: profileImage,
                                cv: cvFile,
                                chosenTools: {"choice_id": selectedIds},
                                socialLinks: [
                                  // ✅ تعديل 2: تمرير روابط التواصل
                                  if (cubit.facebookController.text.isNotEmpty)
                                    {
                                      "name": "facebook",
                                      "link": cubit.facebookController.text,
                                    },
                                  if (cubit.githubController.text.isNotEmpty)
                                    {
                                      "name": "github",
                                      "link": cubit.githubController.text,
                                    },
                                  if (cubit.instagramController.text.isNotEmpty)
                                    {
                                      "name": "instagram",
                                      "link": cubit.instagramController.text,
                                    },
                                  if (cubit.linkedinController.text.isNotEmpty)
                                    {
                                      "name": "linkedin",
                                      "link": cubit.linkedinController.text,
                                    },
                                ],
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
