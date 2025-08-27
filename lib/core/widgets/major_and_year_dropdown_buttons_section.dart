import 'package:flutter/material.dart';
import 'custom_drop_down_button.dart';
import 'package:graph/core/functions/get_years_list.dart';
import 'package:graph/core/widgets/custom_drop_down_button.dart';
import 'package:graph/core/widgets/project_drop_down_button.dart';

import '../../generated/l10n.dart';

class MajorAndYearDropdownButtonsSection extends StatelessWidget {
  const MajorAndYearDropdownButtonsSection({super.key, required this.height});
  final double height;


  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    return Row(
      children: [
        ProjectDropDownButton(height: height, text: lang.project),
        SizedBox(width: 10),
        FutureBuilder<List<String>>(
          future: getYearsList(), // your async function
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(); // show loader while waiting
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Text("No years available");
            }

            return CustomDropDownButton(
              height: height,
              text: lang.year,
              list: snapshot.data!,
            );
          },
        ),
      ],
    );
  }
}






