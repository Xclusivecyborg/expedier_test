import 'package:expedier_test/core/utils/helpers.dart';
import 'package:expedier_test/core/utils/validator.dart';
import 'package:expedier_test/features/authentication/login/presentation/login.dart';
import 'package:expedier_test/general_widgets/app_button.dart';
import 'package:expedier_test/general_widgets/app_textfield.dart';
import 'package:expedier_test/general_widgets/pop_button.dart';
import 'package:expedier_test/general_widgets/success_screen.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 83.0, left: 22, right: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    PopButton(),
                    SizedBox(
                      width: 42,
                    ),
                    Text(
                      "Forgot Password",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 27,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: Helpers.height(context) * 0.09,
                ),
                const Text(
                  "Enter your email address",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                const Text(
                  "We’ll send you a mail to recover your password",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                  ),
                ),
                const SizedBox(
                  height: 49,
                ),
                AppTextField(
                  onChange: (p0) => setState(() {}),
                  height: 42,
                  hintText: "Enter password",
                  controller: _passwordController,
                  validateFunction: Validators.email(),
                ),
                const SizedBox(
                  height: 24,
                ),
                const SizedBox(
                  height: 24,
                ),
                AppButton(
                  margin: EdgeInsets.zero,
                  radius: 6,
                  text: "Reset Password",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SuccessScreeen(
                          title: "Recovery link set",
                          subTitle:
                              "A recovery link has been sent to your email\nClick on this to verify your password",
                          route: Login(),
                          actionText: "Verify Password",
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: Helpers.height(context) * 0.09,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
