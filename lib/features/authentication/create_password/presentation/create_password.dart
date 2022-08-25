import 'package:expedier_test/core/utils/colors.dart';
import 'package:expedier_test/core/utils/constants.dart';
import 'package:expedier_test/core/utils/helpers.dart';
import 'package:expedier_test/core/utils/validator.dart';
import 'package:expedier_test/features/authentication/biometric/presentation/biometric.dart';
import 'package:expedier_test/general_widgets/app_button.dart';
import 'package:expedier_test/general_widgets/app_textfield.dart';
import 'package:expedier_test/general_widgets/pop_button.dart';
import 'package:flutter/material.dart';

class CreatePassword extends StatefulWidget {
  const CreatePassword({Key? key}) : super(key: key);

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final symbolExp = RegExp(symbolRegex);

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
                      "Create Password",
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
                  height: Helpers.height(context) * 0.065,
                ),
                AppTextField(
                  onChange: (p0) => setState(() {}),
                  height: 42,
                  hintText: "Enter password",
                  controller: _passwordController,
                  validateFunction: (value) =>
                      PasswordValidator.validatePassword(value!),
                ),
                const SizedBox(
                  height: 24,
                ),
                AppTextField(
                  onChange: (p0) => setState(() {}),
                  height: 42,
                  hintText: "Confirm password",
                  controller: _confirmPasswordController,
                  validateFunction: (value) {
                    if (value != _passwordController.text) {
                      return "Password does not match";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                _validatorRow(
                  isValidated:
                      _passwordController.text.contains(RegExp(r'[A-Z]')),
                  text: "At lease one uppercase",
                ),
                _validatorRow(
                  isValidated:
                      _passwordController.text.contains(RegExp(r'[0-9]')),
                  text: "At lease one number",
                ),
                _validatorRow(
                  isValidated: symbolExp.hasMatch(_passwordController.text),
                  text: "At lease one special character",
                ),
                _validatorRow(
                  isValidated: _passwordController.text.length >= 8,
                  text: "Mininum of 8 characters",
                ),
                const SizedBox(
                  height: 24,
                ),
                AppButton(
                  margin: EdgeInsets.zero,
                  radius: 6,
                  text: "Continue",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BiometricAuth(),
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

  Column _validatorRow({
    required bool isValidated,
    required String text,
  }) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isValidated ? AppColors.blue : AppColors.grey,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(text),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}



                            // PasswordValidator.validatePassword(value!),
