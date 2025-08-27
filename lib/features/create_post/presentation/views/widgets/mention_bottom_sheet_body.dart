import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/search_cubit/search_cubit.dart';
import 'mention_search_text_feild.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../followers&following/presentation/views/widgets/custom_user_list_view.dart';
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
  late TextEditingController _searchController;
  Timer? _debounce;
  List<Person> searchResults = [];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    searchResults = [];
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(Duration(seconds: 2), () {
      if (query.isNotEmpty) {
        _performSearch(query); // هنا سنرسل الريكوست للباك
      } else {
        setState(() {
          searchResults = [];
        });
      }
    });
  }

  void _performSearch(String query) {
    final cubit = context.read<SearchCubit>();
    cubit.search(name: query); // استدعاء البحث من الـ repo
  }

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
        
        MentionSearchTextFeild(
          lang: widget.lang,
          controller: _searchController,
          onChanged: _onSearchChanged,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is SearchFailuer) {
                  return Center(child: Text('Error: ${state.errorMessage}'));
                }

                if (state is SearchSuccess) {
                  // تحويل بيانات الـ API لقائمة Person
                  final data = state.response['data'] as List? ?? [];
                  searchResults =
                      data
                          .map(
                            (e) =>
                                Person(id: e['id'].toString(), name: e['name'],image: e['profile_image_url']),
                          )
                          .toList();

                  searchResults =
                      (state.response['data'] as List)
                          .map(
                            (e) => Person(
                              id: e['id'].toString(),
                              name: e['name'],
                             image: e['profile_image_url'] ?? '',
                            ),
                          )
                          .toList();
                }
                if (searchResults.isEmpty) {
                  return const SizedBox.shrink();
                }
                return ListView.builder(
                  itemCount: searchResults.length,
                  itemBuilder: (context, index) {
                    final person = searchResults[index];
                    final isChecked = widget.selectedPersons.contains(person);
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: GestureDetector(
                        onTap: () => _toggle(person),
                        behavior: HitTestBehavior.opaque,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomUserListView(person: person),

                            SelectPersonsToMention(
                              checked: isChecked,
                              onChanged: (bool checked) => _toggle(person),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
