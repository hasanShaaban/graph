import 'package:flutter/material.dart';
import '../../../../auth/presentation/views/widgets/custom_dropdown_button.dart';
import '../../../../../generated/l10n.dart';

class GroupManagementDropDown extends StatefulWidget {
  const GroupManagementDropDown({super.key});

  @override
  State<GroupManagementDropDown> createState() =>
      _GroupManagementDropDownState();
}

class _GroupManagementDropDownState extends State<GroupManagementDropDown> {
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
          width: MediaQuery.of(context).size.width * 120 / 412,
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
          width: MediaQuery.of(context).size.width * 120 / 412,
          height: 36,
          iconPadding: 10,
        ),
      ],
    );
  }
}
