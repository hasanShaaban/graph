
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TechToolContainer extends StatelessWidget {
  const TechToolContainer({
    super.key,
    required this.width,
    required this.height,
    required this.color, required this.icon, required this.name,
  });
  final double width, height;
  final Color color;
  final String icon;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: name,
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
          icon.contains('http')?
           SvgPicture.network(icon, width: width*0.5,):
            SvgPicture.asset(icon, width: width*0.5,),
        ),
      ),
    );
  }
}
