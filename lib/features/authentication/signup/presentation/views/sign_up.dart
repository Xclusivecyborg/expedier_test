import 'package:country_calling_code_picker/picker.dart';
import 'package:expedier_test/core/utils/colors.dart';
import 'package:expedier_test/core/utils/helpers.dart';
import 'package:expedier_test/core/utils/validator.dart';
import 'package:expedier_test/features/authentication/signup/presentation/views/privacy_policy.dart';
import 'package:expedier_test/features/authentication/verifyOtp/presentation/verify_otp.dart';
import 'package:expedier_test/general_widgets/app_button.dart';
import 'package:expedier_test/general_widgets/app_textfield.dart';
import 'package:expedier_test/general_widgets/country_code_textfield.dart';
import 'package:expedier_test/general_widgets/pop_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  void _showCountryPicker() async {
    final country = await showCountryPickerSheet(
      context,
    );
    if (country != null) {
      setState(() {
        _selectedCountry = country;
      });
    }
  }

  void initCountry() async {
    final country = await getDefaultCountry(context);
    setState(() {
      _selectedCountry = country;
    });
  }

  final _formkey = GlobalKey<FormState>();
  @override
  void initState() {
    initCountry();
    super.initState();
  }

  Country? _selectedCountry;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 22, right: 22),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PopButton(),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    "Let's get started",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 27,
                    ),
                  ),
                  SizedBox(
                    height: Helpers.height(context) * 0.075,
                  ),
                  const Text(
                    "Enter your mobile number",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  CountryCodeTextField(
                 validateFunction: Validators.notEmpty(),                    height: 42,
                    margin: 0,
                    country: _selectedCountry,
                    controller: _countryController,
                    hintText: "8867 5645 8",
                    onTap: _showCountryPicker,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  _buildDetailsTextfield(
                    title: "Full Name",
                    controller: _fullNameController,
                    validate: Validators.notEmpty(),
                  ),
                  _buildDetailsTextfield(
                    title: "Email Address",
                    controller: _emailController,
                    validate: Validators.email(),
                  ),
                  _buildDetailsTextfield(
                    title: "Country Address",
                    controller: _addressController,
                    validate: Validators.notEmpty(),
                  ),
                  Text.rich(
                    TextSpan(
                      text:
                          "By submitting this form, I confirm that I have read, consent\nand agreed to Expedier's",
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                      children: [
                        TextSpan(
                          text: " User Agreement",
                          style: const TextStyle(
                            color: AppColors.blue,
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                        const TextSpan(
                          text: " and",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        TextSpan(
                          text: " Privacy policy",
                          style: const TextStyle(
                            color: AppColors.blue,
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PrivacyPolicy(),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  AppButton(
                    margin: EdgeInsets.zero,
                    radius: 6,
                    text: "Continue",
                    onTap: () {
                      if (_formkey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VErifyOTP(
                              phoneNumber: _countryController.text,
                            ),
                          ),
                        );
                        return;
                      }
                      ScaffoldMessenger.of(context).showSnackBar(Helpers.snack);
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
      ),
    );
  }

  Column _buildDetailsTextfield({
    required String title,
    required TextEditingController controller,
    required Valid validate,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        AppTextField(
          validateFunction: validate,
          height: 42,
          hintText: title,
          controller: controller,
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    );
  }
}

typedef Valid = FormFieldValidator<String>;
