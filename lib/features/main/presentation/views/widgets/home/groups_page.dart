import 'package:flutter/widgets.dart';
import 'package:graph/core/widgets/major_and_year_dropdown_buttons_section.dart';

class GroupsPage extends StatelessWidget {
  const GroupsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [MajorAndYearDropdownButtonsSection(height: height)],
      ),
    );
  }
}
