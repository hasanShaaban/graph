import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import 'next_button.dart';
import 'signup_profile_picture_section.dart';
import 'custom_text.dart';

import 'spacialization_button.dart';

class SpacializationSection extends StatefulWidget {
  const SpacializationSection({super.key});

  @override
  State<SpacializationSection> createState() => _SpacializationSectionState();
}

class _SpacializationSectionState extends State<SpacializationSection> {
  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return Column(
      children: [
        SizedBox(height: 20),
        customText(text: lang.pickSpecialization),
        SizedBox(height: 16),
        SpacializationButton(),
        SizedBox(height: 60),
        NextButton(
          onPressed: () {
            Navigator.pushNamed(context, SignupProfilePictureSection.name);
          },
        ),
      ],
    );
  }
}
