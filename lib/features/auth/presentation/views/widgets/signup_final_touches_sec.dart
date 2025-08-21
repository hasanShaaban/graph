import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/features/auth/data/models/signup_data_model.dart';
import 'package:graph/features/auth/presentation/manager/student_info_cubit/student_info_cubit.dart';
import '../../manager/final_touches_cubit/final_touches_cubit.dart';
import 'name_and_birth_date_info.dart';
import '../../../../profile/presentation/views/profile_view.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/constants.dart';
import 'custom_text_cairo16_semi_bold.dart';
import 'cv_row.dart';
import 'final_touches_bio_sec.dart';
import 'final_touches_study_spacialization_sec.dart';
import 'final_touches_top_sec.dart';
import 'next_button.dart';
import 'social_links_row.dart';
import 'tech_tools_grid_view.dart';
import 'tech_tools_icon_add.dart';
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

  @override
  void initState() {
    super.initState();
    context.read<StudentInfoCubit>().getStudentInfo();
  }

  @override
  Widget build(BuildContext context) {
    String? gender = widget.signupData.gender;
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
                      FinalTouchesStudySpacializationSec(
                        text1: 'study level: ',
                        text2: '${widget.signupData.studyYearName!} year',
                      ),
                      SizedBox(height: 7),
                      FinalTouchesStudySpacializationSec(
                        text1: 'spacializtion: ',
                        text2: widget.signupData.specializationName ?? '',
                      ),

                      // BlocBuilder<StudentInfoCubit, StudentInfoState>(
                      //   builder: (context, state) {
                      //     if (state is StudentInfoLoading) {
                      //       return Center(child: CircularProgressIndicator());
                      //     } else if (state is StudentInfoSuccess) {
                      //       final data = state.response;

                      //       final studyYear =
                      //           data['year'].firstWhere(
                      //             (y) =>
                      //                 y['id'].toString() ==
                      //                 widget.signupData.studyYear,
                      //           )['name'];

                      //       final specialization =
                      //           data['major'].firstWhere(
                      //             (s) =>
                      //                 s['id'].toString() ==
                      //                  widget.signupData.specialization,
                      //           )['name'];

                      //       return Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           FinalTouchesStudySpacializationSec(
                      //             text1: 'study level: ',
                      //             text2: studyYear,
                      //           ),
                      //           SizedBox(height: 7),
                      //           FinalTouchesStudySpacializationSec(
                      //             text1: 'spacialization: ',
                      //             text2: specialization,
                      //           ),
                      //         ],
                      //       );
                      //     } else if (state is StudentInfoFailuer) {
                      //       return Text("خطأ: ${state.errorMessage}");
                      //     }
                      //     return SizedBox.shrink();
                      //   },
                      // ),
                      SizedBox(height: 30),
                      FinalTouchesBioSec(
                        onBioChanged: (value) {
                          bioText = value;
                        },
                      ),
                      SizedBox(height: 13),
                      CustomTextCairo16SemiBold(text: 'Tech Tools'),
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
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: Constants2.dividerColor(context),
                                  ),
                                  child: SvgPicture.asset(
                                    icons[index],
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
                                    if (!selectedItems.contains(selectedItem)) {
                                      selectedItems.add(selectedItem);
                                    }
                                  });
                                }
                              },
                              child: TechToolsIconAdd(),
                            ),
                          ),
                        ],
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
                            Navigator.pushNamed(context, ProfileView.name);
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
                              context.read<FinalTouchesCubit>().finalTouches(
                                bio: bioText,
                                image: profileImage,
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
