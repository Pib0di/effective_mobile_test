import 'package:effective_mobile_test/ui/common/theme.dart';
import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  final Widget widget;
  final Color? color;
  final bool addBoxShadow;
  final EdgeInsets? padding;
  final double radius;

  const RoundedContainer({
    required this.widget, super.key,
    this.color,
    this.addBoxShadow = false,
    this.padding,
    this.radius = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color ?? AppColors.grey3,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        boxShadow: addBoxShadow
            ? [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 3),
                ),
              ]
            : null,
      ),
      child: widget,
    );
  }
}
