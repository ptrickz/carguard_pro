import 'package:carguard_pro/globals/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final IconData iconData;
  final String hintText;
  final bool isPassword;
  final bool? isObscured;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  const CustomTextFormField({
    super.key,
    required this.iconData,
    required this.hintText,
    required this.isPassword,
    this.isObscured,
    this.suffixIcon,
    required this.controller,
    this.validator,
    this.textInputType,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        keyboardType: widget.textInputType ?? TextInputType.text,
        controller: widget.controller,
        validator: widget.validator,
        obscureText: widget.isObscured ?? false,
        obscuringCharacter: '*',
        decoration: InputDecoration(
          hintText: widget.hintText,
          contentPadding: const EdgeInsets.all(0),
          prefixIcon: Icon(widget.iconData),
          suffixIcon: widget.isPassword ? widget.suffixIcon : null,
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(color: grey),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(color: grey),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(color: grey),
          ),
        ),
      ),
    );
  }
}
