import 'package:flutter/material.dart';
import 'package:template/constants/colors.dart';

/*
  CGrid Component ----------------
 */
class CGrid extends StatelessWidget {
  // Variables ----------------
  final int length;
  final Function(BuildContext, int)? builder;
  final dynamic child;
  final ScrollController? controller;
  final bool? noScroll;
  final Future<void> Function()? onRefresh;
  final EdgeInsetsGeometry? padding;
  final double? aspect;
  final int? crossCount;
  final double? crossSpacing;
  final double? mainSpacing;

  // Props ----------------
  const CGrid({
    required this.length,
    this.builder,
    this.child,
    this.controller,
    this.onRefresh,
    this.noScroll,
    this.padding,
    this.aspect = 1 / 1.3,
    this.crossCount = 2,
    this.crossSpacing = 0,
    this.mainSpacing = 5,
    Key? key,
  }) : super(key: key);

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    if (onRefresh != null) {
      return RefreshIndicator(
        onRefresh: onRefresh!,
        color: AppColors.blue,
        child: buildListView(),
      );
    } else {
      return buildListView();
    }
  }

  GridView buildListView() {
    return GridView.builder(
      itemCount: length,
      controller: controller,
      padding: padding,
      shrinkWrap: noScroll ?? false,
      physics: noScroll ?? false
          ? const NeverScrollableScrollPhysics()
          : const AlwaysScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossCount!,
        childAspectRatio: aspect!,
        crossAxisSpacing: crossSpacing!,
        mainAxisSpacing: mainSpacing!,
      ),
      itemBuilder: (context, index) {
        if (builder != null) {
          return builder!(context, index);
        } else if (child != null) {
          if (child is Widget Function(int)) {
            return child(index);
          } else {
            return child;
          }
        }
        return Container();
      },
    );
  }
}
