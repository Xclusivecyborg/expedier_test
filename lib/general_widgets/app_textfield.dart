import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    Key? key,
    this.width,
    this.height,
    this.hintText,
    this.controller,
    this.minLines,
    this.maxLines,
    this.obscureText = false,
    this.enabled,
    this.validateFunction,
    this.onSaved,
    this.onChange,
    this.keyboardType,
    this.textInputAction,
    this.suffixIcon,
    this.prefixIcon,
    this.bordercolor,
    this.backgroundColor,
    this.autofocus,
    this.label,
    this.labelText,
    this.readOnly = false,
  }) : super(key: key);
  final double? width;
  final double? height;
  final String? hintText;
  final TextEditingController? controller;
  final int? minLines;
  final int? maxLines;
  final bool obscureText;
  final bool? enabled;
  final FormFieldValidator<String>? validateFunction;
  final Function(String)? onSaved, onChange;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? bordercolor, backgroundColor;
  final bool? autofocus;
  final bool readOnly;
  final String? label;
  final String? labelText;
  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  String? error;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: widget.height,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: widget.backgroundColor ?? Colors.white,
          ),
          child: TextFormField(
            textAlign: TextAlign.left,
            onChanged: (val) {
              widget.validateFunction != null
                  ? error = widget.validateFunction!(val)
                  : error = null;
              setState(() {});
              if (widget.onChange != null) widget.onChange!(val);
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: widget.validateFunction != null
                ? widget.validateFunction!
                : (value) {
                    return null;
                  },
            obscureText: widget.obscureText,
            readOnly: widget.readOnly,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                top: error != null
                    ? 18
                    : widget.suffixIcon != null
                        ? 10
                        : 0,
                bottom: 3,
              ),
              suffixIcon: widget.suffixIcon,
              hintText: widget.hintText,
              filled: false,
              hintStyle: TextStyle(
                color: Colors.black.withOpacity(0.5),
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
        if (error != null)
          const SizedBox(
            height: 5.0,
          ),
        if (error != null)
          Text(
            error!,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 12.0,
            ),
          ),
      ],
    );
  }
}
