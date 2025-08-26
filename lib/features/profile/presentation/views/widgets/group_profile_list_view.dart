import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph/core/widgets/shimmer_widgets/shimmer_box.dart';
import 'package:graph/features/groups/presentation/manager/group_member_cubit/group_member_cubit.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/constants.dart';
import 'group_member_info.dart';
import '../../../../../generated/l10n.dart';

class GroupProfileListView extends StatelessWidget {
  const GroupProfileListView({
    super.key,
    required this.height,
    required this.width,
    required this.lang,
  });

  final double height;
  final double width;
  final S lang;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupMemberCubit, GroupMemberState>(
      builder: (context, state) {
        if (state is GroupMemberSuccess) {
          return SizedBox(
            height: height * 130 / 890 - 16,
            width: width,
            child: ListView.builder(
              itemCount: state.members.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder:
                  (context, index) => Padding(
                    padding: EdgeInsets.only(
                      right: lang.lang == 'en' ? 10 : 0,
                      left: lang.lang == 'ar' ? 10 : 0,
                    ),
                    child: GestureDetector(
                      onLongPress: () {
                        showDialog(
                          context: context,
                          builder: (context) => GroupMemberInfo(lang: lang),
                        );
                      },
                      child: SizedBox(
                        height: height * 130 / 890,
                        width: 65,
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Constants2.primaryColor(context),
                              radius: 65 / 2,
                              backgroundImage: NetworkImage(
                                'http://127.0.0.1:8000${state.members[index].image}',
                              ),
                            ),
                            SizedBox(height: 5),
                            SizedBox(
                              height: height * 130 / 890 - 95,
                              width: 65,
                              child: Text(
                                state.members[index].name,
                                textAlign: TextAlign.center,
                                style: AppTextStyle.cairoRegular14.copyWith(
                                  height: 0.9,
                                  overflow: TextOverflow.fade,
                                  color: Constants2.primaryColor(context),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
            ),
          );
        } else if (state is GroupMemberError) {
          return Center(child: Text(state.errorMessage));
        } else {
          return Shimmer.fromColors(
            baseColor: Constants2.lightSecondaryColor(context),
            highlightColor: Constants2.dividerColor(context),
            child: SizedBox(
              height: height * 130 / 890 - 16,
              width: width,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder:
                    (context, index) => Padding(
                      padding: EdgeInsets.only(
                        right: lang.lang == 'en' ? 10 : 0,
                        left: lang.lang == 'ar' ? 10 : 0,
                      ),
                      child: SizedBox(
                        height: height * 130 / 890,
                        width: 65,
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Constants2.primaryColor(context),
                              radius: 65 / 2,
                              backgroundImage: AssetImage(
                                Assets.imagesProfileImage,
                              ),
                            ),
                            SizedBox(height: 5),

                            SizedBox(
                              height: height * 130 / 890 - 95,
                              width: 65,
                              child: shimmerBox(
                                context: context,
                                height: 10,
                                radius: 3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              ),
            ),
          );
        }
      },
    );
  }
}
