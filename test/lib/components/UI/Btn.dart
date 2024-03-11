import 'package:flutter/material.dart';
import 'package:template/components/UI/Text/index.dart';
import 'package:template/constants/colors.dart';

/*
  Btn Component ----------------
 */
class Btn extends StatelessWidget {
  // Variables ----------------
  final String text;
  final TextStyle? style;
  final Function()? func;
  final IconData? icon;

  // Props ----------------
  const Btn(
    this.text,
    this.func, {
    this.icon,
    this.style,
    Key? key,
  }) : super(key: key);

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: func,
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 60),
            padding: const EdgeInsets.all(16),
            backgroundColor: AppColors.blue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          // Если есть иконка
          if (icon != null)
            Container(
              margin: const EdgeInsets.only(right: 15),
              child: Icon(
                icon,
              ),
            ),
          CText(
            text,
            color: AppColors.white,
            size: 16,
          )
        ]));
  }
}
