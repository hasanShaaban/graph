import 'package:flutter/material.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../generated/l10n.dart';

class ProjectPostBodySec extends StatefulWidget {
  const ProjectPostBodySec({super.key, this.onChangedTitle, this.onChangedDescription, });
  final void Function(String)? onChangedTitle;
    final void Function(String)? onChangedDescription;

  @override
  State<ProjectPostBodySec> createState() => _ProjectPostBodySecState();
}

class _ProjectPostBodySecState extends State<ProjectPostBodySec> {


  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 20),
            TextField(
              onChanged: widget.onChangedTitle,
              decoration: InputDecoration(
                hintText: '${lang.title}:',
                hintStyle: AppTextStyle.cairoSemiBold14,
                border: InputBorder.none,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              onChanged: widget.onChangedDescription,
              maxLines: 20,
              decoration: InputDecoration(
                hintText: '${lang.description}...',
                hintStyle: AppTextStyle.cairoSemiBold14,
                border: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
