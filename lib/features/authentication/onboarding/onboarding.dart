import 'package:carousel_slider/carousel_slider.dart';
import 'package:expedier_test/core/utils/colors.dart';
import 'package:expedier_test/core/utils/strings.dart';
import 'package:expedier_test/features/authentication/login/presentation/login.dart';
import 'package:expedier_test/features/authentication/onboarding/widgets/carousel_indicator.dart';
import 'package:expedier_test/features/authentication/signup/presentation/sign_up.dart';
import 'package:expedier_test/general_widgets/app_button.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int _currentindex = 0;
  final int _millisec = 100;
  final _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    List<SlideWidget> slides = [
      SlideWidget(
        image: "assets/images/slide1.png",
        text: AppStrings.slide1Text,
      ),
      SlideWidget(
        image: "assets/images/slide2.png",
        text: AppStrings.slide2Text,
      ),
      SlideWidget(
        image: "assets/images/slide3.png",
        text: AppStrings.slide3Text,
      ),
    ];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 50),
              CarouselSlider.builder(
                carouselController: _controller,
                itemCount: slides.length,
                itemBuilder: (context, index, position) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 267,
                        child: Image.asset(
                          slides[index].image,
                          height: 267,
                          width: double.infinity,
                        ),
                      ),
                      Text(
                        slides[index].text,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                options: CarouselOptions(
                  viewportFraction: 0.88,
                  aspectRatio: 0.9,
                  autoPlay: true,
                  autoPlayAnimationDuration:
                      Duration(milliseconds: _millisec * 2),
                  enableInfiniteScroll: true,
                  autoPlayCurve: Curves.easeInOut,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentindex = index;
                    });
                  },
                ),
              ),
              Carouselindicator(
                slides: slides,
                controller: _controller,
                currentindex: _currentindex,
                millisec: _millisec,
              ),
              const SizedBox(height: 30),
              Column(
                children: [
                  AppButton(
                    margin: const EdgeInsets.symmetric(horizontal: 80),
                    text: "Login",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  AppButton(
                    margin: const EdgeInsets.symmetric(horizontal: 80),
                    hasBorder: true,
                    text: "Sign Up",
                    color: Colors.transparent,
                    textColor: AppColors.naveyBlue,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUp(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SlideWidget {
  String image;
  String text;

  SlideWidget({required this.image, required this.text});
}
