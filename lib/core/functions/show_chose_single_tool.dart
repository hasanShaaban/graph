import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph/core/services/providers/group_provider.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/core/widgets/tech_tool_container.dart';
import 'package:graph/features/auth/data/models/skill_model.dart';
import 'package:graph/features/auth/presentation/manager/get_skills_cubit/get_skills_cubit.dart';
import 'package:graph/features/groups/domain/entity/group_member_entity.dart';
import 'package:graph/generated/l10n.dart';

Future<SkillEntity?> showSingleToolBottomSheet({
  required BuildContext context,
  required SkillEntity? initialChosenTool,
  required S lang,
}) async {
  return await showModalBottomSheet<SkillEntity>(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return DraggableScrollableSheet(
            initialChildSize: 0.6,
            minChildSize: 0.3,
            maxChildSize: 0.9,
            expand: false,
            builder: (context, scrollController) {
              return BlocBuilder<GetSkillsCubit, GetSkillsState>(
                builder: (context, state) {
                  if (state is GetSkillsSuccess) {
                    final skillsList = List<Map<String, dynamic>>.from(
                      state.response,
                    );
                    List<SkillModel> skills = skillsList.map((e) => SkillModel.fromJson(e)).toList();
                    
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                        color: Constants2.lightPrimaryColor(context),
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Container(
                            height: 24,
                            alignment: Alignment.center,
                            child: Container(
                              width: 40,
                              height: 4,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              lang.techTools,
                              style: AppTextStyle.cairoSemiBold20.copyWith(
                                color: Constants2.darkSecondaryColor(context),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Expanded(
                            child: GridView.builder(
                              controller: scrollController,
                              physics: const BouncingScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    mainAxisSpacing: 30,
                                    childAspectRatio: 1,
                                    crossAxisSpacing: 30,
                                  ),
                              itemCount: skills.length,
                              itemBuilder: (context, index) {
                                final tool = 'http://127.0.0.1:8000/storage/${skills[index].icon}';
                                final isSelected = initialChosenTool == SkillEntity(skillName: skills[index].name, skillLogo: skills[index].icon);

                                return GestureDetector(
                                  onTap: () {
                                    context.read<GroupProvider>().setSkillId(skills[index].id);
                                    Navigator.pop(
                                      context,
                                      SkillEntity(skillName: skills[index].name, skillLogo: tool),
                                    ); // close & return
                                  },
                                  child: TechToolContainer(
                                    name: skills[index].name,
                                    width: 60,
                                    height: 60,
                                    color:
                                        isSelected
                                            ? Constants
                                                .deviderColor // selected color
                                            : Constants2.lightSecondaryColor(
                                              context,
                                            ),
                                    icon: tool,
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    );
                  } else if (state is GetSkillsFailuer) {
                    return Center(child: Text(state.errorMessage));
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              );
            },
          );
        },
      ) ?? initialChosenTool;
       // In case the user dismisses the sheet
}
