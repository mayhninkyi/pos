import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomImageWidget extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final double radius;
  const CustomImageWidget({
    Key? key,
    required this.imageUrl,
    required this.width,
    required this.height,
    required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(radius),
                topLeft: Radius.circular(radius))),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          imageBuilder: (context, imageProvider) => Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(radius),
                  topLeft: Radius.circular(radius)),
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
          ),
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.white,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: Colors.white, // Match the background color
                borderRadius: BorderRadius.circular(radius),
              ),
            ),
          ),
          errorWidget: (context, url, error) => const Center(
            child: Icon(Icons.error),
          ),
        ));
  }
}
