
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:neelkanth/ui/utils/theme/app_assets.dart';
import 'package:neelkanth/ui/utils/widgets/common_svg.dart';

class CacheImage extends StatelessWidget {
  final String imageURL;
  final double height;
  final double? topLeftRadius;
  final double? topRightRadius;
  final double? bottomLeftRadius;
  final double? bottomRightRadius;
  final double width;
  final bool? setPlaceHolder;
  final String? placeholderImage;
  final BoxFit? contentMode;

  const CacheImage(
      {Key? key,
      required this.imageURL,
      required this.height,
      required this.width,
      this.setPlaceHolder = true,
      this.placeholderImage,
      this.contentMode,
      this.bottomLeftRadius,
      this.bottomRightRadius,
      this.topLeftRadius,
      this.topRightRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (imageURL == '')
        ? placeHolderWidget(height,width)
        : CachedNetworkImage(
            imageUrl: imageURL,
            imageBuilder: (context, imageProvider) => Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(topLeftRadius ?? 0.0),
                    topRight: Radius.circular(topRightRadius ?? 0.0),
                    bottomRight: Radius.circular(bottomRightRadius ?? 0.0),
                    bottomLeft: Radius.circular(bottomLeftRadius ?? 0.0)),
                image: DecorationImage(
                  image: imageProvider,
                  fit: contentMode ?? BoxFit.contain,
                  // colorFilter:ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                ),
              ),
            ),
            placeholder: (context, url) {
              return placeHolderWidget(height,width);
            },
            errorWidget: (context, url, error) => placeHolderWidget(height,width),
          );
  }

  Widget placeHolderWidget(double height,double width) {
    return Center(
      child: CommonSVG(
        strIcon: placeholderImage ?? AppAssets.svgCategoryPlaceHolder,
        height: height,
        width: width,
      ) ,
    );
    // return Image.asset(
    //   placeholderImage ?? AppAssets.icPlaceholder,
    //   /*?? icAppIcon*/
    //   height: height,
    //   width: width,
    // );
  }
}
