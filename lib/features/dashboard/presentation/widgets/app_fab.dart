import 'package:expedier_test/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppFab extends StatelessWidget {
  const AppFab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.center,
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Container(
        alignment: Alignment.center,
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
          color: AppColors.blue,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          'assets/icons/send.svg',
          color: Colors.white,
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerRight,
        ),
      ),
    );
  }
}
