import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CachedContainer extends StatelessWidget {
  const CachedContainer({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
    this.borderRadius = BorderRadius.zero,
  });

  final String imageUrl;
  final double width;
  final double height;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        imageBuilder: (context, imageProvider) => _ImageBuilder(
          width: width,
          height: height,
          imageProvider: imageProvider,
        ),
        placeholder: (context, url) => _Placeholder(
          width: width,
          height: height,
        ),
        errorWidget: (context, url, error) => _ErrorWidget(
          width: width,
          height: height,
        ),
      ),
    );
  }
}

class _ImageBuilder extends StatelessWidget {
  const _ImageBuilder({
    required this.width,
    required this.height,
    required this.imageProvider,
  });

  final double width;
  final double height;
  final ImageProvider imageProvider;

  @override
  Widget build(BuildContext context) {
    return _Base(
      width: width,
      height: height,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class _Placeholder extends StatelessWidget {
  const _Placeholder({
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return _Base(
      width: width,
      height: height,
      child: Shimmer.fromColors(
        baseColor: Colors.red,
        highlightColor: Colors.yellow,
        child: const SizedBox(),
      ),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget({
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return _Base(
      width: width,
      height: height,
      child: const Icon(Icons.broken_image),
    );
  }
}

class _Base extends StatelessWidget {
  const _Base({
    required this.width,
    required this.height,
    required this.child,
  });

  final double width;
  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: child,
    );
  }
}
