import 'package:expedier_test/core/utils/colors.dart';
import 'package:flutter/material.dart';

class Helpers {
  static double width(context) => MediaQuery.of(context).size.width;
  static double height(context) => MediaQuery.of(context).size.height;

    static const snack =  SnackBar(
    content: Text(
      "Fields Cannot be empty",
      style: TextStyle(
        color: Colors.white,
      ),
    ),
    dismissDirection: DismissDirection.horizontal,
    backgroundColor: AppColors.naveyBlue,
  );
}
