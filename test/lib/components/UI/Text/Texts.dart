import 'package:flutter/material.dart';
import 'package:template/constants/colors.dart';

/*
  Texts Component ----------------
 */
class Texts extends StatelessWidget {
  // Variables ----------------
  final List<dynamic> children;
  final double? size;
  final FontWeight? weight;
  final Color? color;

  // Props ----------------
  const Texts(
    this.children, {
    this.size = 16,
    this.weight = FontWeight.normal,
    this.color = AppColors.black,
    Key? key,
  }) : super(key: key);

  // Styles for tenge symbol
  TextStyle tengeStyles(BuildContext context,
      {double? childSize,
      Color? childColor,
      FontWeight? childWeight,
      double? childHeight}) {
    return TextStyle(
      fontSize: childSize ?? size,
      color: childColor ?? color,
      fontWeight: childWeight ?? weight,
      height: childHeight ?? 1.5,
      fontFamily: Theme.of(context).platform == TargetPlatform.iOS
          ? '.SF UI Display'
          : 'Roboto',
    );
  }

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    List<InlineSpan> textSpans = [];

    for (var child in children) {
      if (child is String) {
        if (child.trim() == 'tenge' || child.trim() == '₸') {
          textSpans.add(TextSpan(
            text: ' ₸',
            style: tengeStyles(context),
          ));
        } else {
          textSpans.add(TextSpan(text: child));
        }
      } else if (child is Map<String, dynamic>) {
        if (!(child['show'] ?? true)) {
          continue;
        }

        String text = child['text'] ?? '';
        double? childSize = child['size'];
        Color? childColor = child['color'];
        FontWeight? childWeight = child['weight'];
        double? childHeight = child['height'];

        if (text.trim() == 'tenge' || text.trim() == '₸') {
          textSpans.add(TextSpan(
            text: ' ₸',
            style: tengeStyles(context,
                childSize: childSize,
                childColor: childColor,
                childWeight: childWeight,
                childHeight: childHeight),
          ));
        } else {
          textSpans.add(TextSpan(
            text: text,
            style: TextStyle(
              fontSize: childSize ?? size,
              color: childColor ?? color,
              fontWeight: childWeight ?? weight,
              height: childHeight,
              fontFamily: 'Circe',
            ),
          ));
        }
      }
    }

    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: size,
          color: color,
          fontWeight: weight,
          fontFamily: 'Circe',
        ),
        children: textSpans,
      ),
    );
  }
}
