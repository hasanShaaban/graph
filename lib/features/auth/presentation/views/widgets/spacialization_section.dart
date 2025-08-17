import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';
import '../../../data/models/signup_data_model.dart';
import 'custom_text.dart';
import 'next_button.dart';
import 'signup_profile_picture_section.dart';
import 'spacialization_button.dart';

class SpacializationSection extends StatefulWidget {
  final SignupDataModel signupData;

  const SpacializationSection({super.key, required this.signupData});

  @override
  State<SpacializationSection> createState() => _SpacializationSectionState();
}

class _SpacializationSectionState extends State<SpacializationSection> {
  String? selectedSpecialization;
  int? spacializationId;
  late SignupDataModel signupData;
  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return Column(
      children: [
        SizedBox(height: 20),
        CustomText(text: lang.pickSpecialization),
        SizedBox(height: 16),
        SpacializationButton(
          selectSpacialization: (int? newValue) {
            setState(() {
              spacializationId = newValue;
            });
          },
        ),
        SizedBox(height: 60),
        NextButton(
          onPressed: () {
   
            if (spacializationId != null) {
              final updatedData = widget.signupData.copyWith(
                specialization: spacializationId!.toString(),
              );
              Navigator.pushNamed(
                context,
                SignupProfilePictureSection.name,
                arguments: updatedData,
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(lang.pleaseSelectSpacialization)),
              );
            }
          },
        ),
      ],
    );
  }
}
