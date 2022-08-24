import 'package:carousel_slider/carousel_slider.dart';
import 'package:expedier_test/core/utils/colors.dart';
import 'package:flutter/material.dart';

class Carouselindicator extends StatelessWidget {
  const Carouselindicator({
    Key? key,
    required this.slides,
    required CarouselController controller,
    required int currentindex,
    required int millisec,
    this.height,
    this.width,
  })  : _controller = controller,
        _currentindex = currentindex,
        _millisec = millisec,
        super(key: key);

  final List slides;
  final CarouselController _controller;
  final int _currentindex;
  final int _millisec;
  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: slides.asMap().entries.map(
              (entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(_currentindex),
                  child: AnimatedContainer(
                    curve: Curves.fastOutSlowIn,
                    duration: Duration(milliseconds: _millisec * 2),
                    width: _currentindex == entry.key
                        ? width ?? 27.0
                        : width ?? 14.0,
                    height: height ?? 6.0,
                    margin: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 4.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: AppColors.naveyBlue,
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        )
      ],
    );
  }
}
