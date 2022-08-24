import 'package:expedier_test/core/utils/colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    this.color,
    this.textColor,
    this.width,
    this.text,
    this.onTap,
    this.padding,
    this.margin,
    this.height,
    this.isLoading = false,
    this.hasBorder = false, this.radius = 10,
  }) : super(key: key);
  final Color? color, textColor;
  final String? text;
  final void Function()? onTap;
  final double? width, height;
   final double radius;
  final EdgeInsetsGeometry? padding, margin;
  final bool isLoading, hasBorder;

  @override
  Widget build(BuildContext context) {
    final bool hasFocus = FocusScope.of(context).hasFocus;

    return InkWell(
      onTap: isLoading
          ? null
          : () {
              if (hasFocus) {
                FocusScope.of(context).unfocus();
              }
              onTap?.call();
            },
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: height,
        padding: padding ?? const EdgeInsets.symmetric(vertical: 15),
        margin:
            margin ?? const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: color ?? AppColors.naveyBlue,
          border: hasBorder
              ? Border.all(
                  color: AppColors.naveyBlue,
                )
              : null,
        ),
        alignment: Alignment.center,
        width: width ?? double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text ?? "Continue",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: textColor ?? Colors.white,
              ),
            ),
            if (isLoading)
              const SizedBox(
                width: 20,
              ),
            if (isLoading)
              const SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator.adaptive())
          ],
        ),
      ),
    );
  }
}
