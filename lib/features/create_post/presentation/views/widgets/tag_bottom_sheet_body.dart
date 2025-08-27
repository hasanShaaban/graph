import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/constants.dart';
import '../../../data/models/tag_model.dart';
import '../../manager/hashtag_search_cubit/hashtag_search_cubit.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../generated/l10n.dart';

class TagBottomSheetBody extends StatefulWidget {
  const TagBottomSheetBody({
    super.key,
    required this.lang,
    required this.initialSelectedTags,
  });
  final S lang;
  final List<int> initialSelectedTags;

  @override
  State<TagBottomSheetBody> createState() => _TagBottomSheetBodyState();
}

class _TagBottomSheetBodyState extends State<TagBottomSheetBody> {
  List<int> selectedTagIds = [];

  @override
  void initState() {
    super.initState();
    selectedTagIds = List.from(widget.initialSelectedTags);
  }

  List<TagModel> filteredTags = [];
  List<TagModel> selectedTags = [];
  Timer? _debounce;

  void _onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (value.trim().isNotEmpty) {
        context.read<HashtagSearchCubit>().hashtagSearch(name: value);
      } else {
        setState(() => filteredTags = []);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(widget.lang.addSomeTags, style: AppTextStyle.cairoSemiBold18),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width * 372 / 412,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              color: Constants.lightSecondryColor,
            ),
            child: Row(
              children: [
                SizedBox(width: 15),
                SvgPicture.asset(Assets.iconsHash),
                SizedBox(width: 3),
                Expanded(child: TextField(onChanged: _onSearchChanged)),
                Material(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context, selectedTags);
                    },

                    child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: SvgPicture.asset(Assets.iconsCheck),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: BlocBuilder<HashtagSearchCubit, HashtagSearchState>(
                builder: (context, state) {
                  if (state is HashtagSearchLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is HashtagSearchSuccess) {
                    final hashtags =
                        state.response['hashtags'] as List<dynamic>;
                    setState(() {
                      filteredTags =
                          hashtags
                              .map(
                                (e) => TagModel(id: e['id'], name: e['name']),
                              )
                              .toList();
                    });
                  }

                  return Wrap(
                    spacing: 5,
                    runSpacing: 8,

                    children:
                        filteredTags.map((tag) {
                          final isSelected = selectedTags.any(
                            (t) => t.id == tag.id,
                          );
                          return GestureDetector(
                            onTap: () {
                              if (isSelected) {
                                selectedTags.removeWhere((t) => t.id == tag.id);
                                selectedTagIds.remove(tag.id);
                              } else {
                                selectedTags.add(tag);
                                selectedTagIds.add(tag.id);
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color:
                                    isSelected
                                        ? Constants2.lightSecondaryColor(
                                          context,
                                        )
                                        : Constants2.lightSecondaryColor(
                                          context,
                                        ).withOpacity(0.3),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '#${tag.name}',
                                    style: AppTextStyle.cairoSemiBold18.copyWith(
                                      color:
                                          isSelected
                                              ? Constants2.secondaryColor(
                                                context,
                                              )
                                              : Constants2.darkSecondaryColor(
                                                context,
                                              ),
                                    ),
                                  ),
                                  if (isSelected)
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (isSelected) {
                                            selectedTags.removeWhere(
                                              (t) => t.id == tag.id,
                                            );
                                            selectedTagIds.remove(tag.id);
                                          } else {
                                            selectedTags.add(tag);
                                            selectedTagIds.add(tag.id);
                                          }
                                        });
                                      },

                                      child: const Padding(
                                        padding: EdgeInsets.only(left: 4),
                                        child: Icon(
                                          Icons.close,
                                          size: 16,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                  );
                },
              ),
            ),
          ),

          // Expanded(
          //   child: ListView.builder(
          //     itemCount: filteredTags.length,

          //     itemBuilder: (context, index) {
          //       final tag = filteredTags[index];
          //       final isSelected = selectedTags.contains(tag);
          //       return GestureDetector(
          //         onTap: () {
          //           setState(() {
          //             if (isSelected) {
          //               selectedTags.remove(
          //                 tag,
          //               );
          //             } else {
          //               selectedTags.add(tag);
          //             }
          //           });
          //         },
          //         child: Padding(
          //           padding: const EdgeInsets.symmetric(vertical: 5),
          //           child: Container(
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(10),
          //               color:
          //                   isSelected
          //                       ? Constants2.lightSecondaryColor(
          //                         context,
          //                       ).withOpacity(0.7) // ⬅ لون أغمق
          //                       : Constants2.lightSecondaryColor(
          //                         context,
          //                       ).withOpacity(0.3),
          //             ),
          //             child: Center(
          //               child: Text(
          //                 '#$tag',
          //                 style: AppTextStyle.cairoSemiBold18.copyWith(
          //                   color:
          //                       isSelected
          //                           ? Constants2.secondaryColor(context)
          //                           : Constants2.darkSecondaryColor(context),
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ),
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
