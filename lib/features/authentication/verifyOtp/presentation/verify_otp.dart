import 'package:expedier_test/core/utils/colors.dart';
import 'package:expedier_test/features/authentication/create_password/presentation/create_password.dart';
import 'package:expedier_test/features/authentication/verifyOtp/presentation/widgets/pin_keyboard.dart';
import 'package:expedier_test/features/authentication/verifyOtp/presentation/widgets/pin_textfield.dart';
import 'package:expedier_test/general_widgets/pop_button.dart';
import 'package:flutter/material.dart';

class VErifyOTP extends StatefulWidget {
  const VErifyOTP({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);

  final String phoneNumber;

  @override
  State<VErifyOTP> createState() => _VErifyOTPState();
}

class _VErifyOTPState extends State<VErifyOTP> {
  var phoneController1 = TextEditingController();
  var phoneController2 = TextEditingController();
  var phoneController3 = TextEditingController();
  var phoneController4 = TextEditingController();
  var phoneController5 = TextEditingController();
  var phoneController6 = TextEditingController();

  @override
  void dispose() {
    phoneController1.dispose();
    phoneController2.dispose();
    phoneController3.dispose();
    phoneController4.dispose();
    phoneController5.dispose();
    phoneController6.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 50.0,
              left: 22,
              right: 22,
              bottom: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PopButton(),
                const SizedBox(
                  height: 25,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 31,
                      right: 31.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Enter the OTP code sent to ",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.phoneNumber,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 32),
                        PinTextFieldRow(
                          phoneController: [
                            phoneController1,
                            phoneController2,
                            phoneController3,
                            phoneController4,
                            phoneController5,
                            phoneController6,
                          ],
                          text: '',
                        ),
                        const SizedBox(height: 26),
                        Container(
                          alignment: Alignment.center,
                          height: 29,
                          width: 94,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: const Text(
                            "00m 45s",
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 29),
                        const Text(
                          "Change mobile number",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 18),
                        InkWell(
                          onTap: () {},
                          child: const Text(
                            "Send a new code",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: AppColors.blue,
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),
                        PinKeyBoard(
                          phoneController1: phoneController1,
                          phoneController2: phoneController2,
                          phoneController3: phoneController3,
                          phoneController4: phoneController4,
                          phoneController5: phoneController5,
                          onSubmit: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CreatePassword(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
