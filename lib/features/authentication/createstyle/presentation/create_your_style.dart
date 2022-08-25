import 'package:expedier_test/core/utils/colors.dart';
import 'package:expedier_test/core/utils/helpers.dart';
import 'package:expedier_test/features/dashboard/presentation/pages/dashboard.dart';
import 'package:expedier_test/general_widgets/app_button.dart';
import 'package:expedier_test/general_widgets/create_style_textfield.dart';
import 'package:expedier_test/general_widgets/pop_button.dart';
import 'package:expedier_test/general_widgets/success_screen.dart';
import 'package:flutter/material.dart';

class CreateYourStyle extends StatefulWidget {
  const CreateYourStyle({Key? key}) : super(key: key);

  @override
  State<CreateYourStyle> createState() => _CreateYourStyleState();
}

class _CreateYourStyleState extends State<CreateYourStyle> {
  final TextEditingController _styleController = TextEditingController();

  @override
  void dispose() {
    _styleController.dispose();
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
                      "Create your style",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 27,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Helpers.height(context) * 0.065,
                ),
                const Center(
                  child: Text(
                    "An Expedier Brand is your unique brand\nidentity you can use to send or receive\npayment within the Expedier network",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 33,
                ),
                CreateStyleTextfield(
                    controller: _styleController, hintText: "Mofiyin"),
                SizedBox(
                  height: Helpers.height(context) * 0.065,
                ),
                const Center(
                  child: Text(
                    "Select an avatar",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                GridView.builder(
                  padding: EdgeInsets.only(
                    left: 47,
                    right: 47,
                    top: 32,
                    bottom: Helpers.height(context) * 0.095,
                  ),
                  itemCount: 6,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.3,
                    mainAxisSpacing: 15,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 3),
                            blurRadius: 2,
                            spreadRadius: 2,
                            color: AppColors.grey.withOpacity(0.4),
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: index == 5
                            ? null
                            : const AssetImage("assets/images/person.png"),
                        child: index == 5
                            ? Image.asset("assets/images/camera.png")
                            : null,
                      ),
                    );
                  },
                ),
                AppButton(
                  margin: EdgeInsets.zero,
                  radius: 6,
                  text: "Save",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SuccessScreeen(
                          title: "Account Registration\nSuccessful!",
                          actionText: "Login",
                          route: ExpNavbar(),
                        ),
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
                  text: "Skip",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SuccessScreeen(
                          title: "Account Registration\nSuccessful!",
                          actionText: "Login",
                          route: ExpNavbar(),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
