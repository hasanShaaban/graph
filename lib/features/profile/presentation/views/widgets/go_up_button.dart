import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
class GoUpButton extends StatelessWidget {
  const GoUpButton({
    super.key,
    required this.scrollController, required this.lang,
  });

  final ScrollController scrollController;
  final S lang;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              scrollController.animateTo(
                0,
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeOutQuint,
              );
            },
            icon: Icon(Icons.arrow_upward_rounded),
          ),
          Text(lang.tapToReturntoTheTop),
          SizedBox(height: 22),
        ],
      ),
    );
  }
}
