import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/constants.dart';

class CustomDropDownMap extends StatelessWidget {
  const CustomDropDownMap({
    super.key,
    required this.list,
    required this.text,
    required this.onChanged,
    required this.width,
    required this.height,
    required this.border,
  });
  final List<Map<String, dynamic>>? list;

  final String text;
  final ValueChanged onChanged;
  final double width;
  final double height;
  final double border;

  @override
  Widget build(BuildContext context) {
    final selectedItem = list!.firstWhere(
      (item) => item['label'] == text,
      orElse:
          () => <String, String>{
            'label': 'public',
            'icon': Assets.iconsEarthAfrica,
          },
    );
    return Container(
      width: width,
      height: height,

      decoration: BoxDecoration(
        color: Constants2.lightSecondaryColor(context),
        borderRadius: BorderRadius.circular(border),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          borderRadius: BorderRadius.circular(border),
          isExpanded: true,
          items:
              list!.map((map) {
                return DropdownMenuItem<String>(
                  value: map['label'],
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SvgPicture.asset(
                      //   map['icon'],
                      //   width: 16,
                      //   height: 16,
                      //   color: Constants2.darkPrimaryColor(context),
                      // ),
                      // const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          map['label'] ?? '',
                          overflow: TextOverflow.ellipsis,
                          maxLines: null,
                          softWrap: true,
                          style: AppTextStyle.cairoSemiBold14.copyWith(
                            color: Constants2.darkPrimaryColor(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
          icon: const SizedBox.shrink(),
          onChanged: onChanged,

          hint: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (selectedItem['icon'] != null) ...[
                SvgPicture.asset(
                  selectedItem['icon'],
                  width: 16,
                  height: 16,
                  color: Constants2.primaryColor(context),
                ),
                const SizedBox(width: 3),
              ],
              Expanded(
                child: Text(
                  text,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: false,
                  style: AppTextStyle.cairoSemiBold14.copyWith(
                    color: Constants2.primaryColor(context),
                  ),
                ),
              ),
            ],
          ),

          //           menuWidth: 200,
        ),
      ),
    );
  }
}
