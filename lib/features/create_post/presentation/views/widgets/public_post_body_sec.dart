import 'package:flutter/material.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../generated/l10n.dart';

class PublicPostBodySec extends StatelessWidget {
  const PublicPostBodySec({super.key,required this.onChanged});
  final void Function(String)? onChanged;

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
              onChanged: onChanged,
              maxLines: 20,

              decoration: InputDecoration(
                hintText: '${lang.description}...',
                hintStyle: AppTextStyle.cairoSemiBold14,
              ),
            ),

          
          ],
        ),
      ),
    );
  }
}
