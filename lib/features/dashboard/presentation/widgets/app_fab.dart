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
      padding: const EdgeInsets.all(3),
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: FloatingActionButton(
        mini: true,
        heroTag: "btn1",
        onPressed: () {},
        backgroundColor: AppColors.blue,
        child: SvgPicture.asset(
          'assets/icons/send.svg',
          color: Colors.white,
          fit: BoxFit.contain,
          alignment: Alignment.centerRight,
        ),
      ),
    );
  }
}
