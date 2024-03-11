import 'package:flutter/material.dart';
import 'package:template/constants/colors.dart';
import 'package:template/extensions/media.dart';
import 'package:template/layouts/base.dart';

/*
  Loading Layout ----------------
 */
class LoadingLayout extends StatelessWidget {
  const LoadingLayout({super.key});

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.scale(
                scale: context.screenWidth * 0.004,
                child: const CircularProgressIndicator(
                    color: AppColors.blue, strokeWidth: 2))
          ],
        ),
      ),
    );
  }
}
