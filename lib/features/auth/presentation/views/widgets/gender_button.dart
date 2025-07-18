

import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';

import '../../../../../core/utils/appAssets.dart';
import 'animated_container_widget.dart';

class GenderButton extends StatefulWidget {
  final FormFieldSetter<String> onGenderSelected;

  const GenderButton({
    super.key,
    required this.onGenderSelected,

  });
 

  @override
  State<GenderButton> createState() => _GenderButtonState();
}

class _GenderButtonState extends State<GenderButton> {
  String? selectedGender;
  @override
  void initState() {
    super.initState();

  }

  void _selectGender(String gender) {
    setState(() {
      selectedGender = gender;
      widget.onGenderSelected(gender);
     
    });
  }

  @override
  Widget build(BuildContext context) {


    final lang = S.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
          
            setState(() {
              _selectGender('Male');
            });

          },
          child: AnimatedContainerWidget(
            whatSelect: selectedGender == 'Male',
            text: lang.male,
            icon: Assets.iconsSmilingBoy,
            widthSelected: 150,
            widthNotSelected: 140,
          ),
        ),
        SizedBox(width: 8),
        GestureDetector(
          onTap: () {
            setState(() {
              _selectGender('Female');
            });
          
          },

          child: AnimatedContainerWidget(
            whatSelect: selectedGender == 'Female',
            text: lang.female,
            icon: Assets.iconsSmilingGirl,
            widthSelected: 150,
            widthNotSelected: 140,
          ),
        ),
      ],
    );
  }
}
