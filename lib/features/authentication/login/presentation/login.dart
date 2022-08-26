import 'package:country_calling_code_picker/picker.dart';
import 'package:expedier_test/core/utils/colors.dart';
import 'package:expedier_test/core/utils/helpers.dart';
import 'package:expedier_test/core/utils/strings.dart';
import 'package:expedier_test/core/utils/validator.dart';
import 'package:expedier_test/features/authentication/reset_password/presentation/reset_password.dart';
import 'package:expedier_test/features/authentication/signup/presentation/views/sign_up.dart';
import 'package:expedier_test/features/dashboard/presentation/pages/dashboard.dart';
import 'package:expedier_test/general_widgets/app_button.dart';
import 'package:expedier_test/general_widgets/app_textfield.dart';
import 'package:expedier_test/general_widgets/country_code_textfield.dart';
import 'package:expedier_test/general_widgets/pop_button.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isVisible = true;
  Country? _selectedCountry;
  final _formkey = GlobalKey<FormState>();

  void initCountry() async {
    final country = await getDefaultCountry(context);
    setState(() {
      _selectedCountry = country;
    });
  }

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

  @override
  void initState() {
    initCountry();
    super.initState();
  }

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
                    height: 98,
                  ),
                  const Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 27,
                    ),
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  const Text(
                    "Sign in to continue to Expedier",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(
                    height: 67,
                  ),
                  CountryCodeTextField(
                    validateFunction: Validators.notEmpty(),
                    height: 42,
                    margin: 0,
                    country: _selectedCountry,
                    controller: _countryController,
                    hintText: "8887 77",
                    onTap: _showCountryPicker,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AppTextField(
                    validateFunction: Validators.password(),
                    obscureText: isVisible,
                    height: 42,
                    hintText: "Password",
                    controller: _passwordController,
                    suffixIcon: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        isVisible ? Icons.visibility : Icons.visibility_off,
                        color: AppColors.grey,
                        size: 20,
                      ),
                      onPressed: () {
                        setState(() {});
                        isVisible = !isVisible;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  AppButton(
                    radius: 6,
                    text: "Login",
                    onTap: () {
                      if (_formkey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ExpNavbar(),
                          ),
                        );
                        return;
                      }
                      ScaffoldMessenger.of(context).showSnackBar(Helpers.snack);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgotPassword(),
                          ),
                        );
                      },
                      child: const Text(
                        AppStrings.forgotPassword,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account yet ?",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(width: 5),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUp(),
                            ),
                          );
                        },
                        child: const Text(
                          "Register",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Image.asset(
                      "assets/images/fingerprint.png",
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
