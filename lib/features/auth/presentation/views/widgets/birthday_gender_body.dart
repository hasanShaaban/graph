import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/constants.dart';
import 'package:intl/intl.dart';

import '../../../../../generated/l10n.dart';
import 'custom_text.dart';
import 'gender_button.dart';

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
  DateTime? selectedTime;
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
            FormField<String>(
              validator: (value) {
                if (selectedTime == null) {
                  return lang.pleaseEnterBirthDate;
                }
                return null;
              },
              onSaved: (value) {
                widget.onBirthDateSaved(
                  DateFormat("yyyy-MM-dd", "en").format(selectedTime!),
                );
              },
              builder: (fieldState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(

                      width: MediaQuery.of(context).size.width * 372 / 412,
                      height: MediaQuery.of(context).size.height * 55 / 892,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Constants.lightSecondryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        onPressed: () {
                          DatePicker.showDatePicker(
                            context,
                            showTitleActions: true,
                            minTime: DateTime(1950, 1, 1),
                            maxTime: DateTime.now(),
                            onConfirm: (date) {
                              setState(() {
                                selectedTime = date;
                                fieldState.didChange("ok");
                              });
                            },
                            currentTime: DateTime.now(),
                            //locale: lang.lang == 'en',
                            //         ? LocaleType.en
                            //         : LocaleType.ar,
                          );
                        },
                        child: Text(
                          selectedTime == null
                              ? 'yyyy-mm-dd'
                              : DateFormat(
                                "yyyy-MM-dd",
                                "en",
                              ).format(selectedTime!),
                          style: AppTextStyle.cairoRegular18.copyWith(
                            color: Constants.darkSecondryColor,
                          ),
                        ),
                      ),
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

            // ElevatedButton(
            //   onPressed: () {
            //     DatePicker.showDatePicker(
            //       context,
            //       showTitleActions: true,
            //       minTime: DateTime(1950, 1, 1),
            //       maxTime: DateTime.now(),
            //       onConfirm: (data) {
            //         setState(() {
            //           selectedTime = data;
            //         });
            //       },
            //       currentTime: DateTime.now(),
            //       locale: LocaleType.ar,
            //     );
            //   },
            //   child:Text(selectedTime==null ? 'yyyy-mm-dd' : DateFormat("yyyy-MM-dd").format(selectedTime!)) ,
            // ),
            // UserNameTextField(
            //   onSaved: widget.onBirthDateSaved,
            //   text: 'yyyy-mm-dd',
            //   width: double.infinity,
            //   textInputType: TextInputType.datetime,
            // ),
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
                          fieldState.didChange(gender);
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
