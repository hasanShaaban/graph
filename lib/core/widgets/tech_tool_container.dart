import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TechToolContainer extends StatelessWidget {
  const TechToolContainer({
    super.key,
    required this.width,
    required this.height,
    required this.color,
    required this.icon,
  });
  final double width, height;
  final Color color;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Name of the tool',
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        //child: Center(child: SvgPicture.asset(icon, width: width * 0.5)),
        child: Center(
          child:
              icon.toLowerCase().endsWith('.svg')
                  ? SvgPicture.network(
                    icon,
                    width: width * 0.5,
                    placeholderBuilder:
                        (context) => const CircularProgressIndicator(),
                    errorBuilder:
                        (context, error, stackTrace) => const Icon(Icons.error),
                  )
                  : CachedNetworkImage(
                    imageUrl: icon,
                    width: width * 0.5,

                    placeholder:
                        (context, url) => const CircularProgressIndicator(),
                    errorWidget:
                        (context, url, error) => const Icon(Icons.error),
                  ),
        ),
      ),
    );
  }
}
