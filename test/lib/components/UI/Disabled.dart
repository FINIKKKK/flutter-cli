import 'package:flutter/material.dart';

/*
  Disabled Component ----------------
 */
class Disabled extends StatelessWidget {
  // Variables ----------------
  final Widget child;
  final bool disabled;

  // Props ----------------
  const Disabled({
    required this.disabled,
    required this.child,
    Key? key,
  }) : super(key: key);

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    return Opacity(
        opacity: disabled ? 0.5 : 1.0,
        child: IgnorePointer(
          ignoring: disabled,
          child: child,
        ));
  }
}