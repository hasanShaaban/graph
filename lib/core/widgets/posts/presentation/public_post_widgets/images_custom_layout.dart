import 'package:flutter/material.dart';

import 'image_viewer.dart';

class ImagesCustomLayout extends StatelessWidget {
  final List<String> imageUrls;
  final VoidCallback? onMorePressed;

  const ImagesCustomLayout({
    super.key,
    required this.imageUrls,
    this.onMorePressed,
  });

  @override
  Widget build(BuildContext context) {
    final totalImages = imageUrls.length;

    if (totalImages == 1) {
      return _buildSingleImage(context);
    } else if (totalImages == 2) {
      return _buildTwoImages(context);
    } else if (totalImages == 3) {
      return _buildThreeImages(context);
    } else {
      return _buildGridWithMore(context);
    }
  }

  Widget _buildSingleImage(BuildContext? context) {
    return _buildImage(
      imageUrls[0],
      fit: BoxFit.contain,
      context: context,
      index: 0,
    );
  }

  Widget _buildTwoImages(BuildContext? context) {
    return Row(
      children: [
        Expanded(child: _buildImage(imageUrls[0], context: context, index: 0)),
        const SizedBox(width: 2),
        Expanded(child: _buildImage(imageUrls[1], context: context, index: 1)),
      ],
    );
  }

  Widget _buildThreeImages(BuildContext? context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: _buildImage(
            imageUrls[0],
            height: 200,
            context: context,
            index: 0,
          ),
        ),
        const SizedBox(width: 2),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              _buildImage(imageUrls[1], height: 99, context: context, index: 1),
              const SizedBox(height: 2),
              _buildImage(imageUrls[2], height: 99, context: context, index: 2),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGridWithMore(BuildContext? context) {
    final displayImages = imageUrls.take(4).toList();

    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 2,
      mainAxisSpacing: 2,
      children: List.generate(4, (index) {
        if (index == 3 && imageUrls.length > 4) {
          return Stack(
            fit: StackFit.expand,
            children: [
              _buildImage(displayImages[index], context: context, index: index),
              Container(
                // ignore: deprecated_member_use
                color: Colors.black.withOpacity(0.5),
                child: Center(
                  child: Text(
                    '+${imageUrls.length - 4}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    if (context != null) {
                      Navigator.pushNamed(
                        context,
                        ImageViewer.name,
                        arguments: {
                          'imageUrls': imageUrls,
                          'initialIndex': 0,
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          );
        } else {
          return _buildImage(
            displayImages[index],
            context: context,
            index: index,
          );
        }
      }),
    );
  }

  Widget _buildImage(
    String url, {
    BoxFit fit = BoxFit.contain,
    double? height,
    int index = 0,
    BuildContext? context,
  }) {
    return GestureDetector(
      onTap: () {
        if (context != null) {
          Navigator.pushNamed(
            context,
            ImageViewer.name,
            arguments: {'imageUrls': imageUrls, 'initialIndex': index},
          );
        }
      },
      child: Container(
        height: height,
        color: Colors.grey[300],
        child: Image.network(
          'http://127.0.0.1:8000$url',
          fit: fit,
          width: double.infinity,
          height: height,
        ),
      ),
    );
  }
}
