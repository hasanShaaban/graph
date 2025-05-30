
import 'package:flutter/material.dart';
import 'custom_text.dart';
import 'gender_button.dart';
import 'user_name_text_field.dart';

class BirthdayGenderBody extends StatelessWidget {
  const BirthdayGenderBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            customText(text: "When's your birthday?"),
            SizedBox(height: 16),
            userNameTextField(
              text: 'yyyy-mm-dd',
              width: double.infinity,
              textInputType: TextInputType.datetime,
            ),
            SizedBox(height: 22),
            customText(text: 'Pick your gender:'),
            GenderButton(),
          ],
        ),
      ),
    );
  }
}
