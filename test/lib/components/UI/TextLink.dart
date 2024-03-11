import 'package:flutter/material.dart';
import 'package:template/components/UI/Text/index.dart';
import 'package:template/constants/colors.dart';

/*
  TextLink Component ----------------
 */
class TextLink extends StatelessWidget {
  // Variables ----------------
  final String text;
  final String? link;
  final Function()? func;
  final TextStyle? style;
  final MainAxisAlignment? align;
  final double? size;

  // Props ----------------
  const TextLink(
    this.text, {
    this.link,
    this.func,
    this.size,
    this.align = MainAxisAlignment.start,
    this.style,
    Key? key,
  }) : super(key: key);

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          link ?? Navigator.pushNamed(context, link!);
          func ?? () => func;
        },
        child: Row(
          mainAxisAlignment: align ?? MainAxisAlignment.start,
          children: [
            CText(
              text,
              color: AppColors.blue,
              size: size,
              style: style,
            ),
          ],
        ));
  }
}
