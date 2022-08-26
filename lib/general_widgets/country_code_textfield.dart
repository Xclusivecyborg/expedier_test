import 'package:country_calling_code_picker/picker.dart';
import 'package:flutter/material.dart';

class CountryCodeTextField extends StatefulWidget {
  const CountryCodeTextField({
    Key? key,
    this.onTap,
    required this.country,
    required this.controller,
    this.color,
    required this.hintText,
    this.suffixIcon,
    this.readOnly = false,
    this.margin = 55,
    this.height = 54,
    this.validateFunction,
    this.onChange,
  }) : super(key: key);
  final Country? country;
  final TextEditingController controller;
  final String hintText;
  final void Function()? onTap;
  final Color? color;
  final double margin, height;
  final Widget? suffixIcon;
  final bool readOnly;
  final FormFieldValidator<String>? validateFunction;
  final void Function(String)? onChange;

  @override
  State<CountryCodeTextField> createState() => _CountryCodeTextFieldState();
}

class _CountryCodeTextFieldState extends State<CountryCodeTextField> {
  String? error;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: widget.height,
          margin: EdgeInsets.symmetric(horizontal: widget.margin),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: widget.color ?? Colors.white,
          ),
          child: Row(
            children: [
              InkWell(
                onTap: widget.onTap,
                child: Row(
                  children: [
                    if (widget.country != null)
                      Image.asset(
                        widget.country!.flag,
                        package: countryCodePackageName,
                        width: 20,
                      ),
                    const SizedBox(width: 5),
                    if (widget.country != null)
                      Text(
                        widget.country!.callingCode,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    const Icon(Icons.arrow_drop_down),
                    Container(
                      height: 35,
                      width: 0.8,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.number,
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
                  readOnly: widget.readOnly,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                      bottom: error != null ? 4 : 0,
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
            ],
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
