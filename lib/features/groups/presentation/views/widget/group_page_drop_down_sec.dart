import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/features/auth/presentation/views/widgets/custom_dropdown_button.dart';
import 'package:graph/generated/l10n.dart';

class GroupPageDropDownSec extends StatefulWidget {
  const GroupPageDropDownSec({super.key});

  @override
  State<GroupPageDropDownSec> createState() => _GroupPageDropDownSecState();
}

class _GroupPageDropDownSecState extends State<GroupPageDropDownSec> {
  String? selectedYear;
  String? selectedSubject;
  final List<String> year = ['first', 'second', 'third', 'fourth', 'fifth'];
  final List<String> subject = ['data', 'project1', 'subject3'];
  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        customDropDownButton(
          border: 9,
          list: year,
          text: selectedYear == null ? lang.year : selectedYear!,
          onChanged: (val) {
            setState(() {
              selectedYear = val;
            });
          },
          width: 120,
          height: 36,
          iconPadding: 10,
        ),
        SizedBox(width: 3),
        customDropDownButton(
          border: 9,
          list: subject,
          text: selectedSubject == null ? lang.subject : selectedSubject!,
          onChanged: (val) {
            setState(() {
              selectedSubject = val;
            });
          },
          width: 120,
          height: 36,
          iconPadding: 10,
        ),
        SizedBox(width: 3),
        SvgPicture.asset(Assets.iconsLeadManagement),
      ],
    );
  }
}
