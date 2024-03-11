import 'package:flutter/material.dart';

/*
  LoadingBlock Component ----------------
 */
class LoadingBlock extends StatefulWidget {
  // Variables ----------------
  final double? height;
  final double? width;
  final double? borderRadius;

  // Props ----------------
  const LoadingBlock({
    Key? key,
    this.height,
    this.width,
    this.borderRadius,
  }) : super(key: key);

  @override
  LoadingBlockState createState() => LoadingBlockState();
}

/*
  State----------------
 */
class LoadingBlockState extends State<LoadingBlock>
    with SingleTickerProviderStateMixin {
  // Variables ----------------
  late AnimationController _controller;
  late Animation<double> _animation;

  // InitState ----------------
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );

    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height ?? 56,
          decoration: BoxDecoration(
              color: Colors.grey[350],
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 4)),
          child: Opacity(
            opacity: 0.3 + (_animation.value * 0.7),
            child: Container(
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }

  // Dispose ----------------
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}