import 'package:flutter/material.dart';
import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../generated/l10n.dart';

class ProjectPostBodySec extends StatefulWidget {
  const ProjectPostBodySec({super.key});

  @override
  State<ProjectPostBodySec> createState() => _ProjectPostBodySecState();
}

class _ProjectPostBodySecState extends State<ProjectPostBodySec> {
  final list = [
    {'label': 'public', 'icon': Assets.iconsEarthAfrica},
    {'label': 'friends', 'icon': Assets.iconsUsers},
    {'label': 'project', 'icon': Assets.iconsPollH},
    {'label': 'group', 'icon': Assets.iconsCoworking},
    {'label': 'job', 'icon': Assets.iconsEmployeeMan},
  ];

  String? selectedProject;
  String? selectedSubject;

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: '${lang.title}:',
                hintStyle: AppTextStyle.cairoSemiBold14,
                border: InputBorder.none,
              ),
            ),
            SizedBox(height: 20),
            TextField(
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
