import 'package:flutter/material.dart';
import 'package:template/components/UI/Text/index.dart';
import 'package:template/constants/colors.dart';
import 'package:template/types/base.dart';

/*
  Select Component ----------------
 */
class Select extends StatefulWidget {
  // Variables ----------------
  final String label;
  final TextEditingController controller;
  final List<ListItem> items;
  final String labelPopup;
  final String? empty;

  // Props ----------------
  const Select(
    this.label,
    this.controller, {
    required this.items,
    required this.labelPopup,
    this.empty,
    Key? key,
  }) : super(key: key);

  @override
  SelectState createState() => SelectState();
}

/*
  State Component ----------------
 */
class SelectState extends State<Select> {
  // Variables ----------------
  dynamic activeItem;

  // InitState ----------------
  @override
  void initState() {
    super.initState();

    widget.empty != null ? activeItem = null : activeItem = 0;
    widget.controller.text = widget.items[0].value;
  }

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Stack(clipBehavior: Clip.none, children: [
          Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 24),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(width: 1, color: AppColors.blue)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CText(activeItem != null
                      ? widget.items.length != 0
                          ? widget.items[activeItem].label
                          : ''
                      : widget.empty ?? ''),
                  const Icon(Icons.keyboard_arrow_down_rounded,
                      color: AppColors.blue)
                ],
              )),
          Positioned(
            top: -10,
            left: 20,
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                color: AppColors.white,
                child: CText(
                  widget.label,
                  color: AppColors.blue,
                  size: 14,
                )),
          )
        ]),
        onTap: () => {});
  }

  // Dispose ----------------
  @override
  void dispose() {
    super.dispose();
  }
}
