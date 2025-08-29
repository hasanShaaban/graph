import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/constants.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../generated/l10n.dart';

class TagBottomSheetBody extends StatefulWidget {
  const TagBottomSheetBody({
    super.key,
    required this.lang,
    required this.initialSelectedTags,
  });
  final S lang;
  final List<String> initialSelectedTags;

  @override
  State<TagBottomSheetBody> createState() => _TagBottomSheetBodyState();
}

class _TagBottomSheetBodyState extends State<TagBottomSheetBody> {
  List<String> allTags = [
    'dart',
    'dart_flutter',
    'dart_language',
    'flutter&dart',
    'dart2',
  ];
  String searchQuery = '';
  List<String> filteredTags = [];
  List<String> selectedTags = [];
  @override
  void initState() {
    super.initState();
    // نسخ التاغات التي تم تمريرها من الصفحة الرئيسية
    selectedTags = List.from(widget.initialSelectedTags);
    // الفلترة تبدأ بعرض كل التاغات
    filteredTags = List.from(allTags);
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
                SvgPicture.asset(Assets.iconsTag),
                SizedBox(width: 3),
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      searchQuery = value;
                      filteredTags =
                          allTags
                              .where(
                                (tag) => tag.toLowerCase().contains(
                                  searchQuery.toLowerCase(),
                                ),
                              )
                              .toList();
                      setState(() {});
                    },
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context, selectedTags);
                  },

                  child: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: SvgPicture.asset(Assets.iconsCheck),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          SingleChildScrollView(
            child: Wrap(
              spacing: 5,
              runSpacing: 8,
       
              children:
                  filteredTags.map((tag) {
                    final isSelected = selectedTags.contains(tag);
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            selectedTags.remove(tag);
                          } else {
                            selectedTags.add(tag);
                          }
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color:
                              isSelected
                                  ? Constants2.lightSecondaryColor(context)
                                  : Constants2.lightSecondaryColor(
                                    context,
                                  ).withOpacity(0.3),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '#$tag',
                              style: AppTextStyle.cairoSemiBold18.copyWith(
                                color:
                                    isSelected
                                        ? Constants2.secondaryColor(context)
                                        : Constants2.darkSecondaryColor(
                                          context,
                                        ),
                              ),
                            ),
                            if (isSelected)
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedTags.remove(tag);
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
