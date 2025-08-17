import 'package:flutter/material.dart';
import '../../../../auth/presentation/views/widgets/custom_dropdown_button.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
    this.list,
    required this.text, required this.onChanged,

  });
  final List<String>? list;

 
  final String text;
  final void Function(dynamic) onChanged;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: customDropDownButton(
        list: list ,
       
        text: text,
        onChanged: onChanged,
        width: 300,
        height: 55,
        border: 15,
        iconPadding: 70,
      ),
    );
  }
}
