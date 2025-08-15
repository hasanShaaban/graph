import 'package:flutter/material.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/generated/l10n.dart';

class PublicPostBodySec extends StatelessWidget {
  const PublicPostBodySec({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextField(
              maxLines: 20,

              decoration: InputDecoration(
                hintText: '${lang.description}...',
                hintStyle: AppTextStyle.cairoSemiBold14,
              ),
            ),

            // SizedBox(height: 10),
            // TextField(
            //   maxLines: 20,
            //   decoration: InputDecoration(
            //     hintText: '${lang.description}...',
            //     hintStyle: AppTextStyle.cairoRegular14,
            //   ),
            // ),
            //Expanded(child: Container(child: Image.asset(''))),
          ],
        ),
      ),
    );
  }
}
