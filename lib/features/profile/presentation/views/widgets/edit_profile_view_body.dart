// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../domain/entity/skill_entity.dart';
// import 'name_birthdate_sec.dart';
// import '../../../../auth/data/models/signup_data_model.dart';
// import '../../../../auth/presentation/manager/final_touches_cubit/final_touches_cubit.dart';
// import '../../../../auth/presentation/views/widgets/final_touches_top_sec.dart';
// import '../../../data/models/profile_model.dart';
// import '../../../domain/entity/profile_entity.dart';
// import 'package:image_picker/image_picker.dart';
// import '../../../../../core/functions/show_tools_bottom_sheet.dart';
// import '../../../../../core/utils/appAssets.dart';
// import '../../../../../core/utils/app_text_style.dart';
// import '../../../../auth/presentation/views/widgets/custom_text_cairo16_semi_bold.dart';
// import '../../../../auth/presentation/views/widgets/cv_row.dart';
// import '../../../../auth/presentation/views/widgets/final_touches_bio_sec.dart';
// import '../../../../auth/presentation/views/widgets/name_and_birth_date_info.dart';
// import '../../../../auth/presentation/views/widgets/next_button.dart';
// import '../../../../auth/presentation/views/widgets/social_links_row.dart';
// import '../../../../groups/presentation/views/widget/add_button.dart';
// import '../../../../groups/presentation/views/widget/group_member_tools_list_view.dart';
// import 'custom_drop_down.dart';

// import '../../../../../generated/l10n.dart';

// class EditProfileViewBody extends StatefulWidget {
//   const EditProfileViewBody({super.key});

//   @override
//   State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
// }

// class _EditProfileViewBodyState extends State<EditProfileViewBody> {
//   final List<String> studyYear = [
//     'first',
//     'second',
//     'third',
//     'fourth',
//     'fifth',
//   ];
//   final List<String> spacialization = [
//     'Software Engineering',
//     'Artificial Intelligence',
//     'Networks and OS',
//   ];

//   String? selectVal;
//   String? selectSpacialization;
//   int? selectedYearId;
//   int? spacializationId;
//   List<String> chosenTools = [];

//   String? bioText;

//   File? profileImage;
//   Future<void> pickImage() async {
//     final picker = ImagePicker();
//     final picked = await picker.pickImage(source: ImageSource.gallery);
//     if (picked != null && mounted) {
//       setState(() {
//         profileImage = File(picked.path);
//       });
//     }
//   }

//   void deleteImage() {
//     setState(() => profileImage = null);
//   }

//   late ProfileEntity profile;

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     final args = ModalRoute.of(context)?.settings.arguments;
//     if (args != null && args is SignupDataModel) {
//       profile = ProfileEntity.fromSignup(args);
//     } else {
//       profile = ProfileEntity(
//         name: "John Doe",
//         bio: "Hello there!",
//         gender: "Male",
//         year: ["third"],
//         major: ["Software Engineering"],
//         skills: [],
//         socialLinks: [],
//         cv: "",
//         image: "",
//         id: 1,
//         rate: 1,
//         groupId: 2,
//       );
//     }

//     bioText = profile.bio;
//     if (profile.year.isNotEmpty) selectVal = profile.year[0];
//     if (profile.major.isNotEmpty) selectSpacialization = profile.major[0];
//   }

//   @override
//   Widget build(BuildContext context) {
//     final cubit = context.read<FinalTouchesCubit>();
//     final signupData =
//         ModalRoute.of(context)?.settings.arguments as SignupDataModel?;
//     if (signupData != null) {
//       CustomTextCairo16SemiBold(text: signupData.studyYear!);
//     }

//     var lang = S.of(context);
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           FinalTouchesTopSection(
//             text: '',
//             lang: lang,
//             onEditTap: pickImage,
//             gender: profile.gender,

//             onDelete: deleteImage,
//             image: profileImage,
//             // newHeight: MediaQuery.of(context).size.height * 200 / 1089,
//           ),
//           //SizedBox(height: 130),
//           NameBirthdateSec(profileEntity: profile),

//           SizedBox(height: 36),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               children: [
//                 FinalTouchesBioSec(
//                   onBioChanged: (value) {
//                     setState(() {
//                       profile = profile.copyWith(bio: value);
//                       bioText = value;
//                     });
//                   },
//                 ),
//                 SizedBox(height: 13),
//                 Divider(),
//               ],
//             ),
//           ),

//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//               CustomTextCairo16SemiBold(
//   text: signupData?.studyYear ?? '',
// ),

//                 Center(
//                   child: CustomDropDown(
//                     list: studyYear,
//                     text:
//                         selectVal == null ? lang.selectYear : "$selectVal year",
//                     onChanged: (value) {
//                       setState(() {
//                         selectVal = value;
//                         selectedYearId = studyYear.indexOf(value) + 1;
//                       });
//                     },
//                   ),
//                 ),

//                 SizedBox(height: 14),
//                 if (selectVal == studyYear[3] ||
//                     selectVal == studyYear[4]) ...[
//                   CustomTextCairo16SemiBold(text: signupData!.specialization!),
//                   Center(
//                     child: CustomDropDown(
//                       list: spacialization,
//                       text:
//                           selectSpacialization == null
//                               ? lang.selectYourSpacialization
//                               : "$selectSpacialization",
//                       onChanged: (value) {
//                         setState(() {
//                           selectSpacialization = value;
//                           spacializationId = spacialization.indexOf(value) + 1;
//                         });
//                       },
//                     ),
//                   ),
//                 ],
//                 SizedBox(height: 14),
//                 Text(lang.techTools, style: AppTextStyle.cairoSemiBold16),
//                 chosenTools.isNotEmpty
//                     ? Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         GroupMemberToolsListView(
//                           lang: lang,
//                           chosenTools: chosenTools,
//                           width: width,
//                         ),
//                         AddButton(
//                           onTap: () async {
//                             final result = await showToolsBottomSheet(
//                               context: context,
//                               initialChosenTools: chosenTools,
//                               lang: lang,
//                               tools: tools,
//                             );
//                             setState(() {
//                               chosenTools = result;
//                             });
//                           },
//                         ),
//                       ],
//                     )
//                     : AddButton(
//                       onTap: () async {
//                         final result = await showToolsBottomSheet(
//                           context: context,
//                           initialChosenTools: chosenTools,
//                           lang: lang,
//                           tools: tools,
//                         );
//                         setState(() {
//                           chosenTools = result;
//                         });
//                       },
//                     ),
//                 SizedBox(height: 14),
//                 SocialLinksRow(
//                   controller: cubit.facebookController,
//                   icon: Assets.iconsFacebook,
//                 ),
//                 SocialLinksRow(
//                   controller: cubit.githubController,
//                   icon: Assets.iconsGithub,
//                 ),
//                 SocialLinksRow(
//                   controller: cubit.instagramController,
//                   icon: Assets.iconsInstagram,
//                 ),
//                 SocialLinksRow(
//                   controller: cubit.linkedinController,
//                   icon: Assets.iconsLinkedin,
//                 ),
//                 SizedBox(height: 12),
//                 CVRow(),
//                 SizedBox(height: 40),

//                 // BlocConsumer<PostSkillsCubit, PostSkillsState>(
//                 //   listener: (context, state) {
//                 //     if (state is PostSkillsSuccess) {
//                 //       ScaffoldMessenger.of(context).showSnackBar(
//                 //         SnackBar(content: Text('Skills saved successfully!')),
//                 //       );
//                 //     } else if (state is PostSkillsFailuer) {
//                 //       ScaffoldMessenger.of(context).showSnackBar(
//                 //         SnackBar(
//                 //           content: Text(
//                 //             'Failed to save skills: ${state.errorMessage}',
//                 //           ),
//                 //         ),
//                 //       );
//                 //     }
//                 //   },
//                 //   builder: (context, state) {
//                 //     if (state is PostSkillsLoading) {
//                 //       return Center(child: CircularProgressIndicator());
//                 //     }
//                 //     return SizedBox.shrink(); // أو خليها Container عادي
//                 //   },
//                 // ),
//                 BlocConsumer<FinalTouchesCubit, FinalTouchesState>(
//                   listener: (context, state) async {
//                     if (state is FinalTouchesSuccess) {
//                       // Navigator.pushNamed(
//                       //   context,
//                       //   SignupVerificationSection.name,
//                       // );
//                       print('well done');
//                     } else if (state is FinalTouchesFailuer) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text(state.errorMessage)),
//                       );
//                     }
//                   },
//                   builder: (context, state) {
//                     return NextButton(
//                       title: lang.Save,
//                       isLoading: state is FinalTouchesLoading,

//                       onPressed: () {
//                         final skillEntities =
//                             chosenTools
//                                 .where((tool) => toolIds.containsKey(tool))
//                                 .map(
//                                   (toolName) => SkillEntity(
//                                     name: toolName,
//                                     id: toolIds[toolName]!,
//                                     logoUrl: '',
//                                   ),
//                                 )
//                                 .toList();

//                         profile = profile.copyWith(
//                           skills: skillEntities,
//                           image: profileImage?.path,
//                         );
//                         final selectedIds =
//                             chosenTools.map((tool) => toolIds[tool]!).toList();

//                         context.read<FinalTouchesCubit>().finalTouches(
//                           bio: bioText,
//                           image: profileImage,
//                           chosenTools: {"choice_id": selectedIds},
//                         );
//                       },
//                     );
//                   },
//                 ),

//                 SizedBox(height: 40),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   List<String> tools = [
//     Assets.imagesFlutter,
//     Assets.imagesDart,
//     Assets.imagesFigma,
//     Assets.imagesFirebase,
//     Assets.imagesGit,
//     Assets.imagesPython,
//     Assets.imagesJs,
//   ];
//   final Map<String, int> toolIds = {
//     Assets.imagesFlutter: 1,
//     Assets.imagesDart: 2,
//     Assets.imagesFigma: 3,
//     Assets.imagesFirebase: 4,
//     Assets.imagesGit: 5,
//     Assets.imagesPython: 6,
//     Assets.imagesJs: 7,
//   };
// }

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entity/skill_entity.dart';
import 'name_birthdate_sec.dart';
import '../../../../auth/data/models/signup_data_model.dart';
import '../../../../auth/presentation/manager/final_touches_cubit/final_touches_cubit.dart';
import '../../../../auth/presentation/views/widgets/final_touches_top_sec.dart';
import '../../../domain/entity/profile_entity.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/functions/show_tools_bottom_sheet.dart';
import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../auth/presentation/views/widgets/custom_text_cairo16_semi_bold.dart';
import '../../../../auth/presentation/views/widgets/cv_row.dart';
import '../../../../auth/presentation/views/widgets/final_touches_bio_sec.dart';
import '../../../../auth/presentation/views/widgets/next_button.dart';
import '../../../../auth/presentation/views/widgets/social_links_row.dart';
import '../../../../groups/presentation/views/widget/add_button.dart';
import '../../../../groups/presentation/views/widget/group_member_tools_list_view.dart';
import 'custom_drop_down.dart';
import '../../../../../generated/l10n.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({super.key});

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

  String? selectVal;
  String? selectSpacialization;
  int? selectedYearId;
  int? spacializationId;
  List<String> chosenTools = [];
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

  late ProfileEntity profile;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args != null && args is SignupDataModel) {
      profile = ProfileEntity.fromSignup(args);
    } else {
      profile = ProfileEntity(
        name: "John Doe",
        bio: "Hello there!",
        gender: "Male",
        year: ["third"],
        major: ["Software Engineering"],
        skills: [],
        socialLinks: [],
        cv: "",
        image: "",
        id: 1,
        rate: 1,
        groupId: 2,
      );
    }

    bioText = profile.bio;
    if (profile.year.isNotEmpty) selectVal = profile.year[0];
    if (profile.major.isNotEmpty) selectSpacialization = profile.major[0];
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FinalTouchesCubit>();
    var lang = S.of(context);
    double width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FinalTouchesTopSection(
            text: '',
            lang: lang,
            onEditTap: pickImage,
            gender: profile.gender,
            onDelete: deleteImage,
            image: profileImage,
          ),
          NameBirthdateSec(profileEntity: profile),
          SizedBox(height: 36),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                FinalTouchesBioSec(
                  onBioChanged: (value) {
                    setState(() {
                      profile = profile.copyWith(bio: value);
                      bioText = value;
                    });
                  },
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
                CustomTextCairo16SemiBold(
                  text: selectSpacialization ?? profile.major.first,
                ),
                SizedBox(height: 8),
                Center(
                  child: CustomDropDown(
                    list: studyYear,
                    text:
                        selectVal?.isNotEmpty == true
                            ? "$selectVal year"
                            : lang.selectYear,
                    onChanged: (value) {
                      setState(() {
                        selectVal = value;
                        selectedYearId = studyYear.indexOf(value) + 1;
                      });
                    },
                  ),
                ),
                SizedBox(height: 14),
                if (selectVal != null &&
                    (selectVal == studyYear[3] ||
                        selectVal == studyYear[4])) ...[
                  CustomTextCairo16SemiBold(
                    text: selectVal ?? profile.year.first,
                  ),
                  Center(
                    child: CustomDropDown(
                      list: spacialization,
                      text:
                          selectSpacialization ?? lang.selectYourSpacialization,
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
                CVRow(),
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
                        final skillEntities =
                            chosenTools
                                .where((tool) => toolIds.containsKey(tool))
                                .map(
                                  (toolName) => SkillEntity(
                                    name: toolName,
                                    id: toolIds[toolName]!,
                                    logoUrl: '',
                                  ),
                                )
                                .toList();

                        profile = profile.copyWith(
                          skills: skillEntities,
                          image: profileImage?.path,
                        );

                        final selectedIds =
                            chosenTools.map((tool) => toolIds[tool]!).toList();

                        context.read<FinalTouchesCubit>().finalTouches(
                          bio: bioText,
                          image: profileImage,
                          chosenTools: {"choice_id": selectedIds},
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
