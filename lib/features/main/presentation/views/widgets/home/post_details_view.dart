import 'package:flutter/material.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/core/widgets/custom_back_button.dart';
import 'package:graph/core/widgets/posts/public_post.dart';
import 'package:graph/generated/l10n.dart';

class PostDetailsView extends StatelessWidget {
  const PostDetailsView({super.key});
  static const name = 'postDetailsView';

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: PostDetailsViewBody()));
  }
}

class PostDetailsViewBody extends StatelessWidget {
  const PostDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder:
              (context, innerBoxIsScrolled) => [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomBackButton(
                        lang: lang,
                        color: Constants2.darkPrimaryColor(context),
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
                            Tab(text: lang.reacts),
                            Tab(text: lang.comments),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
          body: TabBarView(
            children: [
              // Reacts Page
              ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 30,
                itemBuilder:
                    (context, index) => ListTile(title: Text("React $index")),
              ),
              // Comments Page
              ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 30,
                itemBuilder:
                    (context, index) => ListTile(title: Text("Comment $index")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
