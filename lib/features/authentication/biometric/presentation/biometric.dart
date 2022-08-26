import 'package:expedier_test/core/utils/colors.dart';
import 'package:expedier_test/core/utils/helpers.dart';
import 'package:expedier_test/features/authentication/createstyle/presentation/create_your_style.dart';
import 'package:expedier_test/general_widgets/app_button.dart';
import 'package:expedier_test/general_widgets/pop_button.dart';
import 'package:flutter/material.dart';

class BiometricAuth extends StatefulWidget {
  const BiometricAuth({Key? key}) : super(key: key);

  @override
  State<BiometricAuth> createState() => _BiometricAuthState();
}

class _BiometricAuthState extends State<BiometricAuth> {
  bool hasSkippedFaceID = false;
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
                    children: [
                      BiometricType(
                        title: hasSkippedFaceID ? "Fingerprint" : "Face ID ",
                        subtitle: hasSkippedFaceID
                            ? "Enable Fingerprint to log in"
                            : "Enable Face ID to log in",
                        image: hasSkippedFaceID ? "fingerprint" : "faceid",
                        descriptiion: hasSkippedFaceID
                            ? "Enable Fingerprint to log in to the app and authorise\ntransactions using your fingerprint"
                            : "Enable Face ID to log in to the app and authorise\ntransactions using facial recognition",
                      ),
                      AppButton(
                        margin: EdgeInsets.zero,
                        radius: 6,
                        text: hasSkippedFaceID
                            ? "Add fingerprint"
                            : "Add face ID",
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
                        text: !hasSkippedFaceID
                            ? "Skip face ID"
                            : "Skip fingerprint",
                        onTap: !hasSkippedFaceID
                            ? () {
                                setState(() {
                                  hasSkippedFaceID = true;
                                });
                              }
                            : () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const CreateYourStyle(),
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

class BiometricType extends StatelessWidget {
  const BiometricType({
    Key? key,
    required this.image,
    required this.subtitle,
    required this.title,
    required this.descriptiion,
  }) : super(key: key);

  final String image, subtitle, title, descriptiion;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 36),
        Image.asset("assets/images/$image.png"),
        const SizedBox(height: 34),
        Text(
          descriptiion,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: Helpers.height(context) * 0.065,
        ),
      ],
    );
  }
}
