import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:skill_on_base/src/base/utils/utils.dart';

class LoadingIndicator extends StatelessWidget {
  final double size;
  final double strokeWidth;
  final Color? color;
  final double? value;

  const LoadingIndicator({
    Key? key,
    this.size = 30,
    this.strokeWidth = 3,
    this.color,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          value: value,
          strokeWidth: strokeWidth,
          valueColor: AlwaysStoppedAnimation(color ?? context.appColorTheme().primary),
        ),
      ),
    );
  }
}
