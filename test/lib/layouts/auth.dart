import 'package:flutter/material.dart';
import 'package:template/components/UI/Text/index.dart';
import 'package:template/constants/colors.dart';
import 'package:template/layouts/base.dart';

/*
  Auth Layout ----------------
 */
class AuthLayout extends StatelessWidget {
  // Variables ----------------
  final Widget child;
  final List<Widget> text;

  // Props ----------------
  const AuthLayout(
    this.child, {
    required this.text,
    Key? key,
  }) : super(key: key);

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const CText('Template',
            size: 46, weight: FontWeight.bold, color: AppColors.blue),
        const SizedBox(height: 10),

        // Text Content
        Row(mainAxisAlignment: MainAxisAlignment.center, children: text),
        const SizedBox(height: 25),

        // Child --------------
        Container(child: child),
      ]),
    );
  }
}
