
import 'package:flutter/material.dart';
import 'custom_text.dart';
import 'user_name_text_field.dart';

class UserNameBody extends StatelessWidget {
  const UserNameBody({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
  });

  final TextEditingController? firstNameController;
  final TextEditingController? lastNameController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          customText(text: 'What should we call you?'),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              userNameTextField(
                width: MediaQuery.sizeOf(context).width / 2 - 23,
                text: 'First name',
                controller: firstNameController,
              ),
              SizedBox(width: 3),
              userNameTextField(
                width: MediaQuery.sizeOf(context).width / 2 - 23,
                text: 'Last name',
                controller: lastNameController,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
