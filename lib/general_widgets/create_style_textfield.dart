import 'package:expedier_test/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CreateStyleTextfield extends StatefulWidget {
  const CreateStyleTextfield({
    Key? key,
    this.onTap,
    required this.controller,
    this.color,
    required this.hintText,
    this.suffixIcon,
    this.readOnly = false,
    this.margin = 55,
    this.height = 54,
  }) : super(key: key);
  final TextEditingController controller;
  final String hintText;
  final void Function()? onTap;
  final Color? color;
  final double margin, height;
  final Widget? suffixIcon;
  final bool readOnly;

  @override
  State<CreateStyleTextfield> createState() => _CreateStyleTextfieldState();
}

class _CreateStyleTextfieldState extends State<CreateStyleTextfield> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: widget.height,
          width: 85,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(6),
              topLeft: Radius.circular(6),
            ),
            border: Border.all(width: 0.1),
            color: widget.color ?? Colors.white,
          ),
          child: Center(
            child: Image.asset("assets/images/splashlogo.png"),
          ),
        ),
        Expanded(
          child: Container(
            height: widget.height,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(6),
                topRight: Radius.circular(6),
              ),
              border: Border.all(width: 0.1),
              color: widget.color ?? AppColors.blue.withOpacity(0.05),
            ),
            child: TextFormField(
              readOnly: widget.readOnly,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                suffixIcon: widget.suffixIcon,
                hintText: widget.hintText,
                filled: false,
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 20,
                ),
                errorBorder: InputBorder.none,
                errorStyle: const TextStyle(
                  height: 0.0,
                  fontSize: 0.0,
                  color: Colors.yellow,
                ),
                focusedErrorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                labelStyle: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              controller: widget.controller,
            ),
          ),
        ),
      ],
    );
  }
}
