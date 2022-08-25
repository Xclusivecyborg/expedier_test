import 'package:expedier_test/core/utils/colors.dart';
import 'package:expedier_test/core/utils/helpers.dart';
import 'package:flutter/material.dart';

class PinKeyBoard extends StatelessWidget {
  const PinKeyBoard({
    Key? key,
    required this.phoneController1,
    required this.phoneController2,
    required this.phoneController3,
    required this.phoneController4,
    required this.phoneController5,
    this.onSubmit,
  }) : super(key: key);
  final TextEditingController phoneController1;
  final TextEditingController phoneController2;
  final TextEditingController phoneController3;
  final TextEditingController phoneController4;
  final TextEditingController phoneController5;
  final void Function()? onSubmit;

  void _clear(
    TextEditingController phoneController1,
    int index,
    TextEditingController phoneController2,
    TextEditingController phoneController3,
    TextEditingController phoneController4,
    TextEditingController phoneController5,
  ) {
    if (phoneController5.text.isNotEmpty && index == 2) {
      phoneController5.clear();
    } else if (phoneController5.text.isNotEmpty && index == 2) {
      phoneController5.clear();
    } else if (phoneController4.text.isNotEmpty && index == 2) {
      phoneController4.clear();
    } else if (phoneController3.text.isNotEmpty && index == 2) {
      phoneController3.clear();
    } else if (phoneController2.text.isNotEmpty && index == 2) {
      phoneController2.clear();
    } else if (phoneController1.text.isNotEmpty && index == 2) {
      phoneController1.clear();
    }
  }

  void _press(
    TextEditingController phoneController1,
    int index,
    TextEditingController phoneController2,
    TextEditingController phoneController3,
    TextEditingController phoneController4,
    TextEditingController phoneController5, {
    bool isLast = false,
  }) {
    if (index == 1 && isLast) {
      if (phoneController1.text.isEmpty) {
        phoneController1.text = (0).toString();
      } else if (phoneController2.text.isEmpty) {
        phoneController2.text = (0).toString();
      } else if (phoneController3.text.isEmpty) {
        phoneController3.text = (0).toString();
      } else if (phoneController4.text.isEmpty) {
        phoneController4.text = (0).toString();
      } else if (phoneController5.text.isEmpty) {
        phoneController5.text = (0).toString();
      }
    } else {
      if (phoneController1.text.isEmpty) {
        phoneController1.text = (index + 1).toString();
      } else if (phoneController2.text.isEmpty) {
        phoneController2.text = (index + 1).toString();
      } else if (phoneController3.text.isEmpty) {
        phoneController3.text = (index + 1).toString();
      } else if (phoneController4.text.isEmpty) {
        phoneController4.text = (index + 1).toString();
      } else if (phoneController5.text.isEmpty) {
        phoneController5.text = (index + 1).toString();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: Helpers.height(context) * 0.4,
        child: Column(
          children: [
            ...List.generate(
              3,
              (ind) => Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(3, (ind2) {
                    int index = ind * 3 + ind2;
                    return InkWell(
                      splashColor: AppColors.backGgroundColor,
                      splashFactory: InkRipple.splashFactory,
                      onTap: () {
                        _press(
                          phoneController1,
                          index,
                          phoneController2,
                          phoneController3,
                          phoneController4,
                          phoneController5,
                        );
                        if (phoneController5.text.isNotEmpty) {
                          onSubmit!();
                        }
                      },
                      child: SizedBox(
                        width: Helpers.width(context) * 0.15,
                        height: Helpers.width(context) * 0.15,
                        child: Center(
                          child: Text(
                            (index + 1).toString(),
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(3, (index) {
                  return InkWell(
                    splashColor: AppColors.backGgroundColor,
                    splashFactory: InkRipple.splashFactory,
                    onTap: () {
                      if (index == 0 &&
                          phoneController1.text.isNotEmpty &&
                          phoneController2.text.isNotEmpty &&
                          phoneController3.text.isNotEmpty &&
                          phoneController4.text.isNotEmpty &&
                          phoneController5.text.isNotEmpty) {
                        if (onSubmit != null) {
                          onSubmit!();
                        }
                      } else if (index == 1) {
                        _press(
                          phoneController1,
                          index,
                          phoneController2,
                          phoneController3,
                          phoneController4,
                          phoneController5,
                          isLast: true,
                        );
                        if (phoneController5.text.isNotEmpty) {
                          onSubmit!();
                        }
                      } else {
                        _clear(
                          phoneController1,
                          index,
                          phoneController2,
                          phoneController3,
                          phoneController4,
                          phoneController5,
                        );
                      }
                    },
                    child: SizedBox(
                      width: Helpers.width(context) * 0.15,
                      height: Helpers.width(context) * 0.15,
                      child: index == 0
                          ? const Icon(
                              Icons.donut_large,
                              color: AppColors.naveyBlue,
                              size: 4,
                            )
                          : index == 1
                              ? Center(
                                  child: Text(
                                    (0).toString(),
                                    style: const TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                )
                              : const Icon(
                                  Icons.close,
                                  size: 30,
                                ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
