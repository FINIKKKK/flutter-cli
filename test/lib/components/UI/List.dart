import 'package:flutter/material.dart';

/*
  CList Component ----------------
 */
class CList extends StatelessWidget {
  // Variables ----------------
  final int length;
  final Function(BuildContext, int)? builder;
  final dynamic child;
  final ScrollController? controller;
  final EdgeInsetsGeometry? padding;
  final Axis? direction;
  final bool? noScroll;

  // Props ----------------
  const CList({
    required this.length,
    this.builder,
    this.child,
    this.controller,
    this.padding,
    this.direction,
    this.noScroll,
    Key? key,
  }) : super(key: key);

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: length,
        controller: controller,
        scrollDirection: direction ?? Axis.vertical,
        padding: padding,
        shrinkWrap: noScroll ?? false,
        physics: noScroll ?? false
            ? const NeverScrollableScrollPhysics()
            : const AlwaysScrollableScrollPhysics(),
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
        });
  }
}
