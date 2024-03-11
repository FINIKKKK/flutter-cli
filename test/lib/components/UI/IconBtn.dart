import 'package:flutter/material.dart';
import 'package:template/components/UI/Icon.dart';

/*
  IconBtn Component ----------------
 */
class IconBtn extends StatelessWidget {
  // Variables ----------------
  final String icon;
  final Function()? func;
  final String? link;
  final double? size;
  final Color? color;
  final bool? noSplash;

  // Props ----------------
  const IconBtn(
    this.icon, {
    this.func,
    this.link,
    this.size,
    this.color,
    this.noSplash,
    Key? key,
  }) : super(key: key);

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: func ??
            () {
              Navigator.pushNamed(context, link!);
            },
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        style: const ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        highlightColor: noSplash == true ? Colors.transparent : null,
        icon: CIcon(icon, color: color, size: size));
  }
}
