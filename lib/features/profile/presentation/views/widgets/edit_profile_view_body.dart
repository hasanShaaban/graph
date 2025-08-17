import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph/features/auth/presentation/manager/final_touches_cubit/final_touches_cubit.dart';
import '../../../../../core/functions/show_tools_bottom_sheet.dart';
import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../auth/presentation/views/widgets/custom_text_cairo16_semi_bold.dart';
import '../../../../auth/presentation/views/widgets/cv_row.dart';
import '../../../../auth/presentation/views/widgets/final_touches_bio_sec.dart';
import '../../../../auth/presentation/views/widgets/name_and_birth_date_info.dart';
import '../../../../auth/presentation/views/widgets/next_button.dart';
import '../../../../auth/presentation/views/widgets/social_links_row.dart';
import '../../../../groups/presentation/views/widget/add_button.dart';
import '../../../../groups/presentation/views/widget/group_member_tools_list_view.dart';
import 'custom_drop_down.dart';
import 'edit_profile_header.dart';

import '../../../../../generated/l10n.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({super.key});

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  final List<String>? studyYear = [
    'first',
    'second',
    'third',
    'fourth',
    'fifth',
  ];
  final List<String>? spacialization = [
    'Software Engineering',
    'Artificial Intelligence',
    'Networks and OS',
  ];

  String? selectVal;
  String? selectSpacialization;
  int? selectedYearId;
  int? spacializationId;
  List<String> chosenTools = [];
  @override
  Widget build(BuildContext context) {
     final cubit = context.read<FinalTouchesCubit>();
    var lang = S.of(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              EditProfileHeader(height: height, lang: lang, width: width),
            ],
          ),
          SizedBox(height: 130),
          NameAndBirthDateInfo(),
          SizedBox(height: 36),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [FinalTouchesBioSec(onBioChanged: (String ) {  },), SizedBox(height: 13), Divider()],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextCairo16SemiBold(text: 'Study level:'),
                Center(
                  child: CustomDropDown(
                    list: studyYear!,
                    text:
                        selectVal == null ? lang.selectYear : "$selectVal year",
                    onChanged: (value) {
                      setState(() {
                        selectVal = value;
                        selectedYearId = studyYear!.indexOf(value) + 1;
                      });
                    },
                  ),
                ),

                SizedBox(height: 14),
                if (selectVal == studyYear![3] ||
                    selectVal == studyYear![4]) ...[
                  CustomTextCairo16SemiBold(text: 'Spacialization:'),
                  Center(
                    child: CustomDropDown(
                      list: spacialization!,
                      text:
                          selectSpacialization == null
                              ? lang.selectYourSpacialization
                              : "$selectSpacialization",
                      onChanged: (value) {
                        setState(() {
                          selectSpacialization = value;
                          spacializationId = spacialization!.indexOf(value) + 1;
                        });
                      },
                    ),
                  ),
                ],
                SizedBox(height: 14),
                Text(lang.techTools, style: AppTextStyle.cairoSemiBold16),
                chosenTools.isNotEmpty
                    ? GroupMemberToolsListView(
                      lang: lang,
                      chosenTools: chosenTools,
                      width: width,
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
                 SocialLinksRow(controller: cubit.facebookController, icon: Assets.iconsFacebook,),
                      SocialLinksRow(controller: cubit.githubController, icon: Assets.iconsGithub,),
                      SocialLinksRow(controller: cubit.instagramController, icon: Assets.iconsInstagram,),
                      SocialLinksRow(controller: cubit.linkedinController, icon: Assets.iconsLinkedin,),
                    SizedBox(height: 12),
                CVRow(),
                SizedBox(height: 40),
                NextButton(onPressed: () {}, title: lang.Save),
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
    Assets.imagesFlutter,
    Assets.imagesDart,
    Assets.imagesFigma,
    Assets.imagesFirebase,
    Assets.imagesGit,
    Assets.imagesPython,
    Assets.imagesJs,
    Assets.imagesFlutter,
    Assets.imagesDart,
    Assets.imagesFigma,
    Assets.imagesFirebase,
    Assets.imagesGit,
    Assets.imagesPython,
    Assets.imagesJs,
    Assets.imagesFlutter,
    Assets.imagesDart,
    Assets.imagesFigma,
    Assets.imagesFirebase,
    Assets.imagesGit,
    Assets.imagesPython,
    Assets.imagesJs,
    Assets.imagesFlutter,
    Assets.imagesDart,
    Assets.imagesFigma,
    Assets.imagesFirebase,
    Assets.imagesGit,
    Assets.imagesPython,
    Assets.imagesJs,
  ];
}
