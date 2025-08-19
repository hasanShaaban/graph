import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/core/widgets/custom_back_button.dart';
import 'package:graph/generated/l10n.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    super.key,
    required this.lang,
    required this.width, this.state,
  });

  final S lang;
  final double width;
  final state;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: CustomBackButton(
              lang: lang,
              color: Constants2.darkPrimaryColor(context),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              
              children: [
                SvgPicture.asset(
                  width: width * 120 / 412,
                  Assets.iconsNotFound,
                  color: Constants2.darkSecondaryColor(context),
                ),
                Text(
                  state.errorMessage,
                  style: AppTextStyle.cairoSemiBold16.copyWith(
                    color: Constants2.darkSecondaryColor(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
