import 'package:flutter/material.dart';
import 'package:graph/core/widgets/custom_stateless_appbar.dart';
import 'package:graph/features/followers&following/presentation/views/widgets/count_and_divider.dart';
import 'package:graph/features/followers&following/presentation/views/widgets/follow_list_view.dart';
import 'package:graph/features/followers&following/presentation/views/widgets/follow_search_text_field.dart';
import 'package:graph/generated/l10n.dart';

class FollowViewBody extends StatelessWidget {
  const FollowViewBody({super.key, required this.type});

  final String type;

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    return Column(
      children: [
        CustomStatelessAppbar(lang: lang, title: type),
        FollowSearchTextField(lang: lang),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  CountAndDivider(lang: lang, type: type),
                  FollowListView(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
