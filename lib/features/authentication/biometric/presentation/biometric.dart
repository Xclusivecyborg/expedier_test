import 'package:expedier_test/core/utils/colors.dart';
import 'package:expedier_test/core/utils/helpers.dart';
import 'package:expedier_test/features/authentication/createstyle/presentation/create_your_style.dart';
import 'package:expedier_test/general_widgets/app_button.dart';
import 'package:expedier_test/general_widgets/pop_button.dart';
import 'package:flutter/material.dart';

class BiometricAuth extends StatelessWidget {
  const BiometricAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 50.0, left: 22, right: 22, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PopButton(),
              const SizedBox(
                height: 25,
              ),
              Expanded(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Face ID ",
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Enable Face ID to log in",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 36),
                      Image.asset("assets/images/faceid.png"),
                      const SizedBox(height: 34),
                      const Text(
                        "Enable Face ID to log in to the app and authorise\ntransactions using facial recognition",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: Helpers.height(context) * 0.065,
                      ),
                      AppButton(
                        margin: EdgeInsets.zero,
                        radius: 6,
                        text: "Add face ID",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CreateYourStyle(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      AppButton(
                        color: Colors.transparent,
                        textColor: AppColors.naveyBlue,
                        margin: EdgeInsets.zero,
                        radius: 6,
                        text: "Skip face ID",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CreateYourStyle(),
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
    );
  }
}
