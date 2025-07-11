import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';
import 'custom_text.dart';
import 'gender_button.dart';
import 'user_name_text_field.dart';

class BirthdayGenderBody extends StatefulWidget {
 
  final FormFieldSetter<String> onBirthDateSaved;
  final FormFieldSetter<String> onGenderSaved;
  const BirthdayGenderBody({
    super.key,

    required this.onBirthDateSaved,
    required this.onGenderSaved,

  });

  @override
  State<BirthdayGenderBody> createState() => _BirthdayGenderBodyState();
}

class _BirthdayGenderBodyState extends State<BirthdayGenderBody> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomText(text: lang.birthday),
            SizedBox(height: 16),
            UserNameTextField(
            
              onSaved: widget.onBirthDateSaved,
              text: 'yyyy-mm-dd',
              width: double.infinity,
              textInputType: TextInputType.datetime,
            ),
            SizedBox(height: 22),
            CustomText(text: lang.pickGender),
      
            FormField<String>(
              validator: (value) {
                if (selectedGender == null || selectedGender!.isEmpty) {
                  return lang.pleasePickGender;
                }
                return null;
              },
              onSaved: (value) => widget.onGenderSaved(selectedGender),
              builder: (fieldState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GenderButton(
                      onGenderSelected: (gender) {
                        setState(() {
                          selectedGender = gender;
                          fieldState.didChange(
                            gender,
                          ); 
                        });
                      },
                    ),
                    if (fieldState.hasError)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          fieldState.errorText ?? '',
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
