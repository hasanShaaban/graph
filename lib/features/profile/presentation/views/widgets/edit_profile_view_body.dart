import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph/features/profile/domain/entity/social_link_entity.dart';
import 'package:graph/features/profile/presentation/views/widgets/bio_sec.dart';
import 'package:graph/features/profile/presentation/views/widgets/edit_profile_top_sec.dart';
import '../../../domain/entity/skill_entity.dart';
import 'name_birthdate_sec.dart';
import '../../../../auth/presentation/manager/final_touches_cubit/final_touches_cubit.dart';
import '../../../../auth/presentation/views/widgets/final_touches_top_sec.dart';
import '../../../domain/entity/profile_entity.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/functions/show_tools_bottom_sheet.dart';
import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../auth/presentation/views/widgets/custom_text_cairo16_semi_bold.dart';
import '../../../../auth/presentation/views/widgets/cv_row.dart';
import '../../../../auth/presentation/views/widgets/next_button.dart';
import '../../../../auth/presentation/views/widgets/social_links_row.dart';
import '../../../../groups/presentation/views/widget/add_button.dart';
import '../../../../groups/presentation/views/widget/group_member_tools_list_view.dart';
import 'custom_drop_down.dart';
import '../../../../../generated/l10n.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({super.key, required this.profile});
  final ProfileEntity profile;

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  final List<String> studyYear = [
    'first',
    'second',
    'third',
    'fourth',
    'fifth',
  ];
  final List<String> spacialization = [
    'Software Engineering',
    'Artificial Intelligence',
    'Networks and OS',
  ];
  final Map<String, TextEditingController> socialControllers = {};
  String? selectVal;
  String? selectSpacialization;
  int? selectedYearId;
  int? spacializationId;
  List<String> chosenTools = [];
  String? bioText;
  File? profileImage;
  File? cvFile;
  List<SocialLinkEntity> socialLinks = [];
  final TextEditingController bioController = TextEditingController();
  @override
  void initState() {
    super.initState();
    profile = widget.profile;
    if (profile.skills != null && profile.skills!.isNotEmpty) {
      chosenTools = profile.skills!.map((skill) => skill.logoUrl).toList();
    }
    final cubit = context.read<FinalTouchesCubit>();
    if (profile.socialLinks != null && profile.socialLinks!.isNotEmpty) {
      for (var social in profile.socialLinks!) {
        switch (social.name) {
          case 'facebook':
            cubit.facebookController.text = social.link;
            break;
          case 'github':
            cubit.githubController.text = social.link;
            break;
          case 'instagram':
            cubit.instagramController.text = social.link;
            break;
          case 'linkedin':
            cubit.linkedinController.text = social.link;
            break;
        }
      }
    }
  }

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

  late ProfileEntity profile;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FinalTouchesCubit>();
    var lang = S.of(context);
    double width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EditProfileTopSec(
            text: '',
            lang: lang,
            onEditTap: pickImage,
            gender: profile.gender,
            onDelete: deleteImage,
            profile: profile,
          ),
          NameBirthdateSec(profileEntity: profile),
          SizedBox(height: 36),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                BioSec(
                  onBioChanged: (value) {
                    setState(() {
                      profile = profile.copyWith(bio: value);
                      bioText = value;
                    });
                  },
                  profile: profile,
                ),
                SizedBox(height: 13),
                Divider(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextCairo16SemiBold(text: lang.year),
                SizedBox(height: 8),
                Center(
                  child: CustomDropDown(
                    list: studyYear,
                    text:
                        selectVal?.isNotEmpty == true
                            ? "$selectVal year"
                            : profile.year.first,
                    onChanged: (value) {
                      setState(() {
                        selectVal = value;
                        selectedYearId = studyYear.indexOf(value) + 1;
                      });
                    },
                  ),
                ),
                SizedBox(height: 14),
                if ((profile.year.first == 'Fourth Year' ||
                        profile.year.first == 'Fifth Year') ||
                    (selectVal != null &&
                        (selectVal == studyYear[3] ||
                            selectVal == studyYear[4]))) ...[
                  CustomTextCairo16SemiBold(text: lang.pickSpecialization),
                  Center(
                    child: CustomDropDown(
                      list: spacialization,
                      text: selectSpacialization ?? profile.major.first,
                      onChanged: (value) {
                        setState(() {
                          selectSpacialization = value;
                          spacializationId = spacialization.indexOf(value) + 1;
                        });
                      },
                    ),
                  ),
                ],
                SizedBox(height: 14),
                Text(lang.techTools, style: AppTextStyle.cairoSemiBold16),
                chosenTools.isNotEmpty
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
                            final result = await showToolsBottomSheet(
                              context: context,
                              initialChosenTools: chosenTools,
                              lang: lang,
                              tools: tools,
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
                          tools: tools,
                        );
                        setState(() {
                          chosenTools = result;
                        });
                      },
                    ),
                SizedBox(height: 14),
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
                SizedBox(height: 12),
                CVRow(onCVPicked: pickCV),
                SizedBox(height: 40),
                BlocConsumer<FinalTouchesCubit, FinalTouchesState>(
                  listener: (context, state) {
                    if (state is FinalTouchesSuccess) {
                      print('well done');
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
                        final updatedLinks = [
                          SocialLinkEntity(
                            id: 1,
                            name: 'facebook',
                            link: cubit.facebookController.text,
                          ),
                          SocialLinkEntity(
                            id: 2,
                            name: 'github',
                            link: cubit.githubController.text,
                          ),
                          SocialLinkEntity(
                            id: 3,
                            name: 'instagram',
                            link: cubit.instagramController.text,
                          ),
                          SocialLinkEntity(
                            id: 4,
                            name: 'linkedin',
                            link: cubit.linkedinController.text,
                          ),
                        ];
                        final skillEntities =
                            chosenTools
                                .where((tool) => toolIds.containsKey(tool))
                                .map(
                                  (toolName) => SkillEntity(
                                    name: toolName,
                                    id: toolIds[toolName] ?? 0,
                                    logoUrl: '',
                                  ),
                                )
                                .toList();

                        profile = profile.copyWith(
                          skills: skillEntities,
                          image: profileImage?.path,
                          bio: bioText ?? profile.bio,
                          socialLinks: updatedLinks,
                        );

                        final selectedIds =
                            chosenTools
                                .map((tool) => toolIds[tool])
                                .where((id) => id != null)
                                .map((id) => id!)
                                .toList();

                        context.read<FinalTouchesCubit>().finalTouches(
                          bio: bioText ?? profile.bio,
                          image: profileImage,
                          cv: cvFile,
                          yearId: selectedYearId,
                          majorId: spacializationId,
                          chosenTools: {"choice_id": selectedIds},
                          socialLinks: [
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
                SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<String> tools = [
    Assets.imagesFlutter,
    Assets.imagesDart,
    Assets.imagesFigma,
    Assets.imagesFirebase,
    Assets.imagesGit,
    Assets.imagesPython,
    Assets.imagesJs,
  ];

  final Map<String, int> toolIds = {
    Assets.imagesFlutter: 1,
    Assets.imagesDart: 2,
    Assets.imagesFigma: 3,
    Assets.imagesFirebase: 4,
    Assets.imagesGit: 5,
    Assets.imagesPython: 6,
    Assets.imagesJs: 7,
  };
}
