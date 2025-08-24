import 'dart:io';
import 'package:flutter/material.dart';

class FullImagesPage extends StatelessWidget {
  final List<File> images;
  final int initialIndex;

  const FullImagesPage({
    super.key,
    required this.images,
    this.initialIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: initialIndex);

    return Scaffold(
 
      body: PageView.builder(
        controller: controller,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return InteractiveViewer(
            child: Image.file(
              images[index],
              fit: BoxFit.contain,
            ),
          );
        },
      ),
    );
  }
}
