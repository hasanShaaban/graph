import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/core/widgets/custom_drop_down_button.dart';
import '../utils/appAssets.dart';
import '../utils/app_text_style.dart';
import '../utils/constants.dart';
import '../../generated/l10n.dart';

class MajorAndYearDropdownButtonsSection extends StatelessWidget {
  const MajorAndYearDropdownButtonsSection({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    return Row(
      children: [
        CustomDropDownButton(height: height, text: lang.year, list: projects),
        SizedBox(width: 10),
        CustomDropDownButton(height: height, text: lang.subject, list: years),
      ],
    );
  }
}



List<String> projects = [
  'Algorithms and data structures hjfk jh kjdhf kj',
  'project 1',
  'data base 1',
  'project 2',
  'data base 2',
  'project 3',
  'data base 3',
];

List<String> years = ['first', 'second', 'third', 'fourth', 'fifth'];

