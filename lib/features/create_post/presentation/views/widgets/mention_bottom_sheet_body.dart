import 'package:flutter/material.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../followers&following/presentation/views/widgets/custom_user_list_view.dart';
import '../../../../followers&following/presentation/views/widgets/follow_search_text_field.dart';
import '../../../../profile/data/models/person_model.dart';
import 'select_persons_to_mention.dart';
import '../../../../../generated/l10n.dart';

class MentionBottomSheetBody extends StatefulWidget {
  const MentionBottomSheetBody({
    super.key,
    required this.lang,
    required this.onPersonSelected,
    required this.onPersonUnselected,
    required this.selectedPersons,
    required this.allPersons,
  });

  final S lang;
  final Set<Person> selectedPersons;
  final Function(Person) onPersonSelected;
  final Function(Person) onPersonUnselected;
  final List<Person> allPersons;

  @override
  State<MentionBottomSheetBody> createState() => _MentionBottomSheetBodyState();
}

class _MentionBottomSheetBodyState extends State<MentionBottomSheetBody> {
   void _toggle(Person person) {
    final checked = widget.selectedPersons.contains(person);
    setState(() {
      if (checked) {
        widget.onPersonUnselected(person);
      } else {
        widget.onPersonSelected(person);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Text(
            widget.lang.mentionAndShareWithFriends,
            style: AppTextStyle.cairoSemiBold18,
          ),
        ),
        SizedBox(height: 18),
        FollowSearchTextField(lang: widget.lang),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                final person = widget.allPersons[index];
                final isChecked = widget.selectedPersons.contains(person);
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: GestureDetector(
                      onTap: () => _toggle(person), 
                        behavior: HitTestBehavior.opaque,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomUserListView(),
                        SelectPersonsToMention(  checked: isChecked,
                           onChanged: (bool checked) => _toggle(person),)

                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
