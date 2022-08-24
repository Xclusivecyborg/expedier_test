import 'package:expedier_test/core/utils/colors.dart';
import 'package:flutter/material.dart';

class PinTextFieldRow extends StatelessWidget {
  const PinTextFieldRow({
    Key? key,
    required this.phoneController,
    required this.text,
  }) : super(key: key);

  final List<TextEditingController> phoneController;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(5, (index) {
        return Expanded(
          child: PinTextField(
            phoneController: phoneController[index],
          ),
        );
      }),
    );
  }
}

class PinTextField extends StatefulWidget {
  const PinTextField({
    Key? key,
    required this.phoneController,
  }) : super(key: key);

  final TextEditingController phoneController;

  @override
  State<PinTextField> createState() => _PinTextFieldState();
}

class _PinTextFieldState extends State<PinTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: AppColors.grey.withOpacity(0.3),
          width: 1,
        ),
      ),
      width: 50,
      height: 43,
      child: TextField(
        readOnly: true,
        controller: widget.phoneController,
        onChanged: (val) {
          if (val.length == 1 || widget.phoneController.text.length == 1) {
            setState(() {
              FocusScope.of(context).nextFocus();
            });
          }
        },
        textAlign: TextAlign.center,
        cursorColor: AppColors.primaryColor,
        keyboardType: TextInputType.number,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }
}
