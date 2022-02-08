import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageProviderWidget extends StatelessWidget {
  final String imageUrl;
  const ImageProviderWidget({Key? key, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        alignment: Alignment.center,
        placeholder: (context, url) =>
            Image.asset('assets/cached_image/no_image.png'),
      ),
    );
  }
}
