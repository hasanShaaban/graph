import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../profile/data/models/person_model.dart';

import 'bottom_button_container.dart';
import 'custom_bottom_sheet_container.dart';
import 'mention_bottom_sheet_body.dart';
import 'tag_bottom_sheet_body.dart';
import '../../../../../generated/l10n.dart';

class CreatPostBottomButtons extends StatefulWidget {
  const CreatPostBottomButtons({
    super.key,
    required this.selectedVal,
    required this.selectedPersons,
    required this.onAddPerson,
    required this.onRemovePerson,
    required this.onPickImages,
    required this.selectedTags,
    required this.onTagsChanged,
  });
  final String selectedVal;
  final Set<Person> selectedPersons;
  final void Function(Person) onAddPerson;
  final void Function(Person) onRemovePerson;
  final VoidCallback? onPickImages;
  final List<String> selectedTags;

  final void Function(List<String>) onTagsChanged;

  @override
  State<CreatPostBottomButtons> createState() => _CreatPostBottomButtonsState();
}

class _CreatPostBottomButtonsState extends State<CreatPostBottomButtons> {
  final List<Person> allPersons = List.generate(
    20,
    (index) => Person(id: '$index', name: 'User $index'),
  );

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return Container(
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (widget.selectedPersons.isNotEmpty) ...[
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children:
                  widget.selectedPersons.map((person) {
                    return Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          width: MediaQuery.of(context).size.width * 104 / 412,
                          height: 35,
                          decoration: BoxDecoration(
                            color: Constants.lightSecondryColor,
                            borderRadius: BorderRadius.circular(18),
                          ),

                          child: Text(person.name),
                        ),
                        Positioned(
                          right: 0,
                          child: GestureDetector(
                            onTap: () => widget.onRemovePerson(person),
                            child: Stack(
                              children: [
                                SvgPicture.asset(Assets.iconsCross),
                                Positioned(
                                  right: -1,
                                  left: -1,
                                  top: 5,

                                  child: SvgPicture.asset(Assets.iconsCross),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
            ),
            const SizedBox(height: 12),
          ],
          Row(
            children: [
              widget.selectedVal == 'project'
                  ? BottomButtonContainer(
                    text: lang.addGroup,
                    icon: Assets.iconsCoworking,
                    onTap: () {},
                  )
                  : BottomButtonContainer(
                    text: lang.mention,
                    icon: Assets.iconsUserTag,
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (BuildContext context) {
                          return SafeArea(
                            child: CustomBottomSheetContainer(
                              lang: lang,
                              widget: MentionBottomSheetBody(
                                lang: lang,
                                onPersonSelected: widget.onAddPerson,
                                onPersonUnselected: widget.onRemovePerson,
                                selectedPersons: widget.selectedPersons,
                                allPersons: allPersons,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
              SizedBox(width: MediaQuery.of(context).size.width * 15 / 412),
              BottomButtonContainer(
                text: lang.addTags,
                icon: Assets.iconsUserTag,
                onTap: () async {
                  final result = await showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (BuildContext context) {
                      return SafeArea(
                        child: CustomBottomSheetContainer(
                          lang: lang,
                          widget: TagBottomSheetBody(
                            lang: lang,
                            initialSelectedTags: List.from(widget.selectedTags),
                          ),
                        ),
                      );
                    },
                  );
                  if (result != null) {
                    widget.onTagsChanged(result);
                  }
                },
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 15 / 412),
              BottomButtonContainer(
                text: lang.addImages,
                icon: Assets.iconsAddImage,
                onTap: () {
                  widget.onPickImages!();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
