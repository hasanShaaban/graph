import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/features/auth/presentation/views/widgets/name_and_birth_date_info.dart';
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
  const SignupFinalTouchesSec({super.key});
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
  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FinalTouchesTopSection(lang: lang),
                NameAndBirthDateInfo(),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FinalTouchesStudySpacializationSec(
                        text1: 'study level: ',
                        text2: '4th year',
                      ),
                      SizedBox(height: 7),
                      FinalTouchesStudySpacializationSec(
                        text1: 'spacializtion: ',
                        text2: 'Software Engineering',
                      ),
                      SizedBox(height: 30),
                      FinalTouchesBioSec(),
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
                      SocialLinksRow(),
                      SocialLinksRow(),
                      SocialLinksRow(),
                      SocialLinksRow(),
                      SizedBox(height: 20),
                      CVRow(),
                      SizedBox(height: 20),
                      NextButton(
                        onPressed: () {
                          // Navigator.pushNamed(context, SignupFindFriends.name);
                        },
                        title: 'Save',
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
