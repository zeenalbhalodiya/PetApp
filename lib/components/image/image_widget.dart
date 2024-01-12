// import 'package:extended_image/extended_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import '../app_asset.dart';
import '../colors.dart';

class NetworkImageWidget extends StatelessWidget {
  final String? imageUrl;
  final double? height;
  final double? width;
  final bool? isProfile;
  final bool? isVideoFeed;
  final Color? color;
  final BoxFit? fit;
  final BorderRadius? borderRadius;
  const NetworkImageWidget({
    this.isProfile = false,
    Key? key,
    this.height,
    this.width,
    this.color,
    this.isVideoFeed,
    this.fit,
    this.imageUrl,
    this.borderRadius = BorderRadius.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(10),
      child: CachedNetworkImage(
        key: ValueKey(imageUrl),
        fit: fit ?? BoxFit.cover,
        height: height,
        maxWidthDiskCache: 350,
        memCacheWidth: 350,
        cacheKey: imageUrl,
        width: width,
        filterQuality: FilterQuality.low,
        color: color,
        useOldImageOnUrlChange: true,
        fadeOutDuration: const Duration(milliseconds: 0),
        fadeOutCurve: Curves.easeInOut,
        fadeInDuration: const Duration(microseconds: 0),
        fadeInCurve: Curves.easeIn,
        imageUrl: imageUrl!,
        progressIndicatorBuilder: (context, url, downloadProgress) {
          return Shimmer.fromColors(
              baseColor: isVideoFeed != null && isVideoFeed!
                  ? primaryBlack
                  : Colors.grey[300]!,
              highlightColor: isVideoFeed != null && isVideoFeed!
                  ? primaryBlack
                  : Colors.grey[100]!,
              child: Container(
                color: Colors.white,
              ));
          //    Center(
          //   child: Lottie.asset(
          //     'assets/json/loader.json',
          //     height: 100,
          //     width: 100,
          //   ),
          // );
        },
        errorWidget: (context, url, error) {
          return isProfile ?? false
              // ignore: prefer_const_constructors
              ? ColoredBox(
                  // ignore: sort_child_properties_last
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Center(
                      child: SvgPicture.asset(
                        AppAsset.user,
                        fit: BoxFit.contain,
                        color: grey,
                        // height: height ?? 100,
                        // width: width ?? 100,
                      ),
                    ),
                  ),
                  color: textFieldColor)
              : Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    color: Colors.white,
                  ));
        },
      ),
    );
  }
}
