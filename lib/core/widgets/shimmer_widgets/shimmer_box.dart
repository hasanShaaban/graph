import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import 'package:shimmer/shimmer.dart';

Widget shimmerBox({required BuildContext context ,double width = double.infinity, double height = 16, double radius = 8}) {
  return Shimmer.fromColors(
    baseColor: Constants2.lightPrimaryColor(context),
    highlightColor: Constants2.dividerColor(context),
    child: Container(
      margin: const EdgeInsets.all(5),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
      ),
    ),
  );
}