import 'package:flutter/material.dart';
import 'package:template/constants/colors.dart';

/*
  Toggle Component ----------------
 */
class Toggle extends StatefulWidget {
  // Variables ----------------
  final Function() func;
  final bool? isSwitch;

  // Props ----------------
  const Toggle(this.func, {
    this.isSwitch,
    Key? key,
  }) : super(key: key);

  // Builder ----------------
  @override
  ToggleState createState() => ToggleState();
}

/*
  State Component ----------------
 */
class ToggleState extends State<Toggle> {
  // Variables ----------------
  late bool isSwitched;

  // InitState ----------------
  @override
  void initState() {
    super.initState();
    isSwitched = widget.isSwitch ?? false;
    print('widget.isSwitch ${widget.isSwitch}');
  }

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSwitched = !isSwitched;
        });
        widget.func();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 24.0,
        width: 48.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color:
          isSwitched ? AppColors.yellow : AppColors.yellow.withOpacity(0.4),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              curve: Curves.easeIn,
              duration: const Duration(milliseconds: 200),
              left: isSwitched ? 25.0 : 0.0,
              right: isSwitched ? 0.0 : 25.0,
              top: 4.5,
              child: Container(
                height: 15,
                width: 15,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Dispose ----------------
  @override
  void dispose() {
    super.dispose();
  }
}