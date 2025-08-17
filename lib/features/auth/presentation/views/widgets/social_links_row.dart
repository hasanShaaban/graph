import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/constants.dart';

class SocialLinksRow extends StatelessWidget {
  const SocialLinksRow({super.key, required this.controller, required this.icon});
  final TextEditingController controller;
    final String icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
        SvgPicture.asset(icon),
          SizedBox(width: 10),
          Expanded(
            child: SizedBox(
              height: 24,
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  fillColor: Constants2.lightSecondaryColor(context),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide.none,
                  ),
                ),  
              ),
            ),
          ),
        ],
      ),
    );
  }
}
