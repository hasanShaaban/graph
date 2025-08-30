import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/features/create_post/presentation/manager/hashtag_search_cubit/hashtag_search_cubit.dart';
import 'package:graph/features/create_post/presentation/manager/hashtag_search_cubit/hashtag_search_state.dart';
import 'package:graph/generated/l10n.dart';

class TagBottomSheetBody extends StatefulWidget {
  final S lang;
  final List<String> selectedNewHashtags;
  final void Function(List<String>) onHashtagsChanged;

  const TagBottomSheetBody({
    super.key,
    required this.lang,
    required this.selectedNewHashtags,
    required this.onHashtagsChanged,
  });

  @override
  State<TagBottomSheetBody> createState() => _TagBottomSheetBodyState();
}

class _TagBottomSheetBodyState extends State<TagBottomSheetBody> {
  Timer? _debounce;
  List<String> tagsToShow = [];

  void _onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (value.trim().isNotEmpty) {
        context.read<PostHashtagSearchCubit>().postHashtagSearch(name: value);
      } else {
        setState(() {
          tagsToShow = [];
        });
      }
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(widget.lang.addSomeTags, style: AppTextStyle.cairoSemiBold18),
          const SizedBox(height: 20),
          Container(
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              color: Constants.lightSecondryColor,
            ),
            child: Row(
              children: [
                const SizedBox(width: 15),
                Expanded(
                  child: TextField(
                    onChanged: _onSearchChanged,
                    decoration: InputDecoration(
                      hintText: widget.lang.addSomeTags,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context, widget.selectedNewHashtags);
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Icon(Icons.check, color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: BlocConsumer<PostHashtagSearchCubit, PostHashtagSearchState>(
              listener: (context, state) {
                if (state is PostHashtagSearchFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Error: ${state.errorMessage}"),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              builder: (context, state) {
                List<String> displayTags = [];
                bool loading = state is PostHashtagSearchLoading;

                if (state is PostHashtagSearchSuccess) {
                  displayTags = state.hashtags.newHashtags;
                }

                return Stack(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: displayTags.length,
                      itemBuilder: (context, index) {
                        final tag = displayTags[index];
                        final isSelected = widget.selectedNewHashtags.contains(
                          tag,
                        );

                        return ListTile(
                          title: Text('#$tag'),
                          trailing:
                              isSelected
                                  ? Icon(Icons.check, color: Colors.blue)
                                  : null,
                          onTap: () {
                            final updated = List<String>.from(
                              widget.selectedNewHashtags,
                            );
                            if (isSelected) {
                              updated.remove(tag);
                            } else {
                              updated.add(tag);
                            }
                            widget.onHashtagsChanged(updated);
                          },
                        );
                      },
                    ),
                    if (loading)
                      const Positioned.fill(
                        child: Center(child: CircularProgressIndicator()),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
