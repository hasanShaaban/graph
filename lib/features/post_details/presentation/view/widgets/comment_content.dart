// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:comment_tree/data/comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/features/post_details/presentation/manager/add_comment_cubit/add_comment_cubit.dart';
import 'package:graph/generated/l10n.dart';

class CommentContent extends StatelessWidget {
  const CommentContent({
    super.key,
    required this.lang,
    required this.data,
    this.responseCount,
    required this.id,
  });

  final S lang;
  final Comment data;
  final int? responseCount;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${data.userName}',
          style: AppTextStyle.cairoSemiBold16.copyWith(
            color: Constants2.darkPrimaryColor(context),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Constants2.lightSecondaryColor(context),
            boxShadow: [
              BoxShadow(
                blurRadius: 6,
                color: Colors.black.withOpacity(0.16),
                offset: Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.only(
              topLeft: lang.lang == 'en' ? Radius.zero : Radius.circular(19),
              topRight: lang.lang == 'en' ? Radius.circular(19) : Radius.zero,
              bottomLeft: Radius.circular(19),
              bottomRight: Radius.circular(19),
            ),
          ),
          padding: EdgeInsets.all(10),
          child: Text(
            '${data.content}',
            style: AppTextStyle.cairoRegular16.copyWith(
              color: Constants2.darkPrimaryColor(context),
              height: 1.1,
            ),
          ),
        ),
        SizedBox(height: 5),

        responseCount != null
            ? InkWell(
              onTap: () {
                
              },
              child: Row(
                children: [
                  Text(
                    responseCount.toString(),
                    style: AppTextStyle.cairoSemiBold14.copyWith(
                      color: Constants2.darkSecondaryColor(context),
                    ),
                  ),
                  SizedBox(width: 5),
                  SvgPicture.asset(Assets.iconsReply),
                  SizedBox(width: 5),
                  Text(
                    lang.reply,
                    style: AppTextStyle.cairoSemiBold14.copyWith(
                      color: Constants2.darkSecondaryColor(context),
                    ),
                  ),
                  SizedBox(width: 15),
                ],
              ),
            )
            : SizedBox(),
      ],
    );
  }
}

class BottomCommentTextField extends StatefulWidget {
  const BottomCommentTextField({
    super.key,
    required this.width,
    required this.lang,
    required this.postId,
  });

  final double width;
  final S lang;
  final int postId;

  @override
  State<BottomCommentTextField> createState() => _BottomCommentTextFieldState();
}

class _BottomCommentTextFieldState extends State<BottomCommentTextField> {
  final TextEditingController _controller = TextEditingController();
  bool _isButtonEnabled = false;
  int? _replyToCommentId;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final isNotEmpty = _controller.text.trim().isNotEmpty;
      if (isNotEmpty != _isButtonEnabled) {
        setState(() => _isButtonEnabled = isNotEmpty);
      }
    });
  }

  void setReplyTo(int? commentId) {
    setState(() {
      _replyToCommentId = commentId;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      child: SizedBox(
        width: widget.width - 40,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: widget.width * 45 / 2 / 412,
              backgroundImage: AssetImage(Assets.imagesProfileImage),
            ),
            SizedBox(
              width: widget.width * 260 / 412,
              child: TextField(
                controller: _controller,
                maxLines: 5,
                minLines: 1,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  filled: true,
                  fillColor: Constants2.lightSecondaryColor(context),
                  hintText: widget.lang.addComment,
                  hintStyle: AppTextStyle.cairoSemiBold16.copyWith(
                    color: Constants2.darkSecondaryColor(context),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      width: 2,
                      color: Constants2.primaryColor(context),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      width: 2,
                      color: Constants2.darkSecondaryColor(context),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      width: 2,
                      color: Constants2.primaryColor(context),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: widget.width * 45 / 412,
              height: widget.width * 45 / 412,
              child: MaterialButton(
                onPressed:
                    _isButtonEnabled
                        ? () {
                          if (_replyToCommentId == null) {
                            // root comment
                            context.read<AddCommentCubit>().addComment(
                              postId: widget.postId,
                              comment: _controller.text,
                            );
                          } else {
                            // reply
                            log('response');
                          }

                          _controller.clear();
                          setState(() {
                            _replyToCommentId =
                                null; // reset back to root comment
                          });
                        }
                        : null, // disables button
                padding: const EdgeInsets.all(10),
                color:
                    _isButtonEnabled
                        ? Constants2.primaryColor(context)
                        : Constants2.darkSecondaryColor(context),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: SvgPicture.asset(
                  Assets.iconsPaperPlane,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
