// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/core/widgets/custom_back_button.dart';
import 'package:graph/core/widgets/posts/public_post.dart';
import 'package:graph/features/post_details/presentation/view/widgets/comments_page.dart';
import 'package:graph/features/post_details/presentation/view/widgets/reacts_page.dart';
import 'package:graph/generated/l10n.dart';

class PostDetailsView extends StatelessWidget {
  const PostDetailsView({super.key});
  static const name = 'postDetailsView';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PostDetailsViewBody(),
        backgroundColor: Constants2.lightPrimaryColor(context),
      ),
    );
  }
}

class PostDetailsViewBody extends StatelessWidget {
  const PostDetailsViewBody({super.key});

  static const Map reactsId = {
    1: Assets.iconsReactLove,
    2: Assets.iconsReactLaugh,
    3: Assets.iconsReactClap,
  };

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          physics: BouncingScrollPhysics(),
          headerSliverBuilder:
              (context, innerBoxIsScrolled) => [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: CustomBackButton(
                          lang: lang,
                          color: Constants2.darkPrimaryColor(context),
                        ),
                      ),
                      SizedBox(height: 10),
                      PublicPost(lang: lang, width: width, height: height),
                      SizedBox(height: 25),
                      SizedBox(
                        width: width / 1.8,
                        child: TabBar(
                          labelPadding: EdgeInsets.all(0),
                          padding: EdgeInsets.zero,
                          indicator: UnderlineTabIndicator(
                            borderSide: BorderSide(
                              width: 2,
                              color: Constants2.primaryColor(context),
                            ),
                            insets: EdgeInsets.symmetric(horizontal: 20),
                          ),
                          labelStyle: AppTextStyle.cairoSemiBold16,
                          labelColor: Constants2.primaryColor(context),
                          unselectedLabelColor: Constants2.darkSecondaryColor(
                            context,
                          ),
                          tabs: [
                            Tab(text: lang.comments),
                            Tab(text: lang.reacts),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                ),
              ],
          body: TabBarView(
            children: [
              // Comments Page
              CommentsPage(lang: lang, width: width),
              // Reacts Page
              ReactsPage(reactsId: reactsId),
            ],
          ),
        ),
      ),
    );
  }
}
