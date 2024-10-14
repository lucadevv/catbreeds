import 'package:flutter/material.dart';

class SearchSliverPersistentHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  SearchSliverPersistentHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // Asegúrate de que el contenido esté dentro de los límites de minHeight y maxHeight
    final double effectiveHeight = maxHeight - shrinkOffset > minHeight
        ? maxHeight - shrinkOffset
        : minHeight;

    return SizedBox(
      height: effectiveHeight,
      child: child, // Se pasa el widget hijo dentro del SliverPersistentHeader
    );
  }

  @override
  bool shouldRebuild(SearchSliverPersistentHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
