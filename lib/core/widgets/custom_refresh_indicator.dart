import 'dart:io';
import 'package:flutter/cupertino.dart';
import '/config/all_imports.dart';

class CustomRefreshIndicator extends StatelessWidget {
  const CustomRefreshIndicator({
    required this.child,
    required this.onRefresh,
    required this.keyRefresh,
    super.key,
  });

  final Widget child;
  final Future<void> Function() onRefresh;
  final GlobalKey<RefreshIndicatorState> keyRefresh;

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? buildAndroidRefreshIndicator(context)
        : buildIosRefreshIndicator();
  }

  Widget buildIosRefreshIndicator() {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        CupertinoSliverRefreshControl(
          onRefresh: onRefresh,
          key: keyRefresh,
        ),
        SliverToBoxAdapter(
          child: child,
        ),
      ],
    );
  }

  Widget buildAndroidRefreshIndicator(BuildContext context) {
    return RefreshIndicator(
      key: keyRefresh,
      onRefresh: onRefresh,
      color: context.theme.progressIndicatorTheme.color,
      backgroundColor:
          context.theme.progressIndicatorTheme.refreshBackgroundColor,
      child: child,
    );
  }
}
