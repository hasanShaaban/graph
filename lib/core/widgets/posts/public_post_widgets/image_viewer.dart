import 'package:flutter/material.dart';
import '../../../utils/constants.dart';
import '../../custom_back_button.dart';
import '../../../../generated/l10n.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ImageViewer extends StatelessWidget {
  const ImageViewer({
    super.key,
    required this.imageUrls,
    required this.initialIndex,
  });

  final List<String> imageUrls;
  final int initialIndex;
  static const name = 'ImageViewer';

  @override
  Widget build(BuildContext context) {
    final controller = PageController(initialPage: initialIndex);
    final lang = S.of(context);
    return Scaffold(
      backgroundColor: Constants2.lightSecondaryColor(context),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Constants2.lightPrimaryColor(context),
        leading: CustomBackButton(
          lang: lang,
          color: Constants2.darkPrimaryColor(context),
        ),
      ),
       body: PhotoViewGallery.builder(
        itemCount: imageUrls.length,
        pageController: controller,
        scrollDirection: Axis.vertical,
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            semanticLabel: index.toString(),
            imageProvider: AssetImage(imageUrls[index]),
            heroAttributes: PhotoViewHeroAttributes(tag: imageUrls[index]),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 1,
          );
        },
        backgroundDecoration: BoxDecoration(color: Constants2.lightSecondaryColor(context)),
      ),
    );
  }
}
