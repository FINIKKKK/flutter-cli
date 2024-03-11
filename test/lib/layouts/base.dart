import 'package:flutter/material.dart';
import 'package:template/constants/colors.dart';

/*
  Main Layout ----------------
 */
class BaseLayout extends StatelessWidget {
  // Variables ----------------
  final Widget? child;
  final List<Widget>? children;
  final Color? bg;
  final EdgeInsets? padding;
  final bool? isScrollable;

  // Props ----------------
  const BaseLayout({
    this.child,
    this.children,
    this.bg = AppColors.bg,
    this.padding = EdgeInsets.zero,
    this.isScrollable = false,
    Key? key,
  }) : super(key: key);

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    Widget content;

    if (child != null) {
      content = child!;
    } else if (children != null) {
      content = Column(children: children!);
    } else {
      throw ArgumentError('Не передан аргумент child либо children');
    }

    if (padding != null) {
      content = Padding(padding: padding!, child: content);
    }

    if (isScrollable == true) {
      content = SingleChildScrollView(child: content);
    }

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(child: content),
    );
  }
}
