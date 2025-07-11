import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/constants.dart';

class TechToolsGridView extends StatelessWidget {
  const TechToolsGridView({super.key,  required this.items, required this.itemBuilder});

//  final List<String> icons;
final List<String> items;
  final Widget Function(String item, int index) itemBuilder;
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      children: List.generate(items.length, (index) {
        return GestureDetector(
          onTap: () {
            Future.microtask(() {
              Navigator.pop(context, index);
            });
          },
          child: Card(
            margin: EdgeInsets.all(15),
            color: Constants.deviderColor,

            // child: SvgPicture.asset(
            //   fit: BoxFit.none,
            //   width: 44,
            //   height: 44,
            //   icons[index],
            // ),
            // child: Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text(icons[index]),
            // ),
            child:   itemBuilder(items[index], index),
          ),
        );
      }),
    );
  }
}
