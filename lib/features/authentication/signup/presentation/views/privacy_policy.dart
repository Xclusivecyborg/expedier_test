import 'package:expedier_test/core/utils/strings.dart';
import 'package:expedier_test/general_widgets/pop_button.dart';
import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

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
                      "Privacy Policy",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 27,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 52),
                const Text(
                  AppStrings.privacyPolicy,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
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
