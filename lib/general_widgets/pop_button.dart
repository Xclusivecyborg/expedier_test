import 'package:expedier_test/core/utils/colors.dart';
import 'package:flutter/material.dart';

class PopButton extends StatelessWidget {
  const PopButton({
    Key? key,
    this.onTap,
    this.icon,
    this.color,
    this.backgroundColor,
    this.isTransaparent = false,
    this.padding,
    this.iconSize = 20,
    this.margin,
  }) : super(key: key);
  final void Function()? onTap;
  final IconData? icon;
  final Color? color, backgroundColor;
  final bool isTransaparent;
  final EdgeInsetsGeometry? padding, margin;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ??
          () {
            Navigator.pop(context);
          },
      child: Container(
        padding: padding ?? const EdgeInsets.fromLTRB(5, 5, 5, 5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isTransaparent
              ? Colors.transparent
              : backgroundColor ?? AppColors.bluelight,
        ),
        child: Icon(
          icon ?? Icons.arrow_back,
          size: iconSize,
          color: color ?? AppColors.blue,
        ),
      ),
    );
  }
}
